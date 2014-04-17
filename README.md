# Introduction

This project is designed to show the internal workings of computer.

Topics that will be covered, include:

- Machine Language
- The Central Processing Unit (CPU)
  - How a CPU performs its operations
  - Instruction Fetch-Execute sequence
  - How they are implemented
- The Control Unit
- Random Access Memory (RAM)
- Data Storage

Due to the nature of this project, this manual is subject to change over time to adapt to the progress of the students.

In this project you will be building a simple computer with a central processing unit with support for a few instructions and some memory. The instructions that will be implemented are simple operations such moving data between registers and performing simple addition operations.

By the end of the project, your computer should be able to demonstrate the operation of the following program:

```AsciiDoc
MOV A, B
INC B
MOV B, A
INC B
```

# Project Components

## Power Supply

In this project, we will be using a standard 5 volt direct current power supply. We will be connecting the positive terminal to our supply rail called `VCC` and this is by convention red colored. The negative terminal will be connected to our reference rail called ground or `GND` and is by convention black but may appear at times as blue.

In this lab, we will use `VCC`, `5V` and `+5V`

## Breadboard

In this project, we will be using a prototyping project board more commonly known as a breadboard. It contains small holes which share an electric connection with holes in the same row or column. Note that only the holes called "power rails" connect along their column, designated by a red or blue line, taking up the sides of the prototyping area. WIthin the prototyping area, components are NOT connected in columns, but by rows. Be sure you know which connects in which way. There are two areas on the breadboard: the prototyping area and the supply rails.

The prototyping area located in the middle is where you will place the components in this project. The prototyping area has a grid of holes, identified by a letter and number written on the top and side. These holes are electrically connected in a line of five (i.e. pins 1A through 1E are all connected but not to 1F or 2A). There is a gap in the middle which will be where you put the center of your DIP (Dual Inline Package) components so that you can make connections to their pins. This means that ALL chips, LEDs, and switches need to "straddle" the gap along the middle to properly function.

The supply rails are arranged in two rows connected in a long line with a red or blue stripe next to them. They are electrically connected as indicated by the line next to them (i.e. a break in the line means a break in the connection). These are used for your power supply connection and you should attach them to `VCC` or `GND` for red and blue respectively. Note that their value will never change, once connected, VCC wil lalways be "high" and GND will always be "low".

![A breadboard graphic](https://rawgithub.com/er1/s228/master/breadboard.svg)

## Wires

We will be using 22 gauge solid core copper wire for this project.

The wires should be properly cut and the plastic insulation must be stripped from the inner conductor before use. The amount of insulation stripped should nominally expose 6mm (1/4 inches) of wire. To ensure proper wire organization, measure the length needed, then add 12 mm to that length for the nonisulated ends, before cutting and stripping it. Make sure to keep to a proper wiring theme, to make debugging easier.

## Integrated Circuit Chips

We will be using standard 300mil plastic Dual Inline Package (DIP) Integrated circuit chips for this project. Again, remember that ALL chips, LEDs, and switches need to "straddle" the gap along the middle to properly function.

## Passive Components
### Resistor

We will be using 330 &Ohm; resistors as a means to limit current through LEDs and to serve as pull-ups on switches. The clock circuit will make use of two 22 K&Ohm; resistors as part of a resistor-capacitor (RC) tank circuit. These connect along a column, and are required for proper LED functionality.

### Capacitor

We will be using a capacitor in the clock circuit as part of the RC tank circuit. These connect similarly to wires, linking two rows together. They do not need to be placed at the center, as they are not DIP chips.

## Light Emitting Diodes

We will be using a strip of Light Emiting Diodes (LEDs) as a means of visualizing binary data values. These must always be using in series with a resistor so that they will not burn out.

## Switches

We will be using a strip of switches to toggle between data values. Make sure to determine which side is 'on' and which side is 'off' before wiring.

# Data Representation

Inside the computer, we need a way of representing information, however, the only means we have is through voltage levels. The information we can store on a register is called a bit and is the absence or presence of a voltage potential relative to a common reference. The convention we have adopted is that the presence of a voltage represents a logical `1` and the absence of a voltage represents a logical `0`

## Binary

Decimal | Binary | Decimal | Binary | Decimal | Binary | Decimal | Binary
:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:
0 | `0000` | 1 | `0001` | 2 | `0010` | 3 | `0011`
4 | `0100` | 5 | `0101` | 6 | `0110` | 7 | `0111`
8 | `1000` | 9 | `1001` | 10 | `1010` | 11 | `1011`
12 | `1100` | 13 | `1101` | 14 | `1110` | 15 | `1111`

# Logic Gates

All logic on an IC is built from logic gates. Logic gates are a combination of transistors to form logical boolean operations. The simplest gates to produce are the NOT gate, NAND gate and NOR gate. Using these gates, more familiar gates such as AND and OR can be built.

<!-- elaborate more on gates -->

# Project 

## Introductory Labs

### Equipment and Data Representation

In this lab, we will introduce ourselves to the equipment in the lab. We will also look at what is required to represent data electrically and how to get output from it. We will set up a simple circuit to produce data values with a switch, visualize the value with an LED and then use the value produced as an input to a logic gate and then visualize the output of a logic gate.

You will have been issued a lab kit containing:

- A project board
- A power supply
- A wire cutting and stripping tool
- A chip removing tool

The project kits issued this year have the project board integrated with the power supply, an additional breadboard is also included in case you run out of space on your project board later on in the lab.

#### Before You Begin

This is a lab which deals with electricity, your lab demonstrator should have given you a quick talk about the safety of dealing with electricity. While the voltage and current levels are not high enough to cause serious injury to anyone caution must still be taken with this equipment. The equipment may also become damaged if wired improperly. If at any point you are not sure about the setup of your project board, call over your lab instructor.

__If something is not working or components become hot, turn off the power.__ Look for the issue or call over your lab instructor if needed.

__IF YOU SMELL SMOKE OR BURNING, CUT THE POWER ON YOUR POWER SUPPLY IMMEDIATELY AND CALL OVER YOUR LAB INSTRUCTOR!__

#### Steps

1. Take out your project board from the kit that was issued to you, verify that it works.
2. Hook up all supply rails to +5V and Ground on the power supply.
3. Hook up a switch pack and LED pack.
4. Use the switch to control the LED.
5. Hook up a logic gate and use switches for its input and an LED for its output.

![Example circuit for Lab 1](https://rawgithub.com/er1/s228/master/lab1_bb.svg)

### Circuits using Logic ICs (Half Adder)

In this lab, we will look at the circuits involved in forming logical equations. The circuit we will be using is called the half-adder which is used for adding two bits together to get a result.

In using two bits, we need two inputs, one to represent each bit. Because we are using the binary number system, we can potentially end up with two digits in the result since our addition overflows or carries into another digit (in the case of 1+1). This means we will need two outputs to represent the result.

We will be representing our inputs as A and B and our outputs as C and S. S will be the sum of the two digits and C will be the value that carries over.

```
  A
+ B
---
 CS
```
In order to construct our circuit, we will need to know the equation that represents each bit in the result. To do this, we can construct a truth table which can help us in determining the equations.

| A | B | &bull; | C | S |
|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | = | 0 | 0 |
| 0 | 1 | = | 0 | 1 |
| 1 | 0 | = | 0 | 1 |
| 1 | 1 | = | 1 | 0 |

The derived equations are constructed from the primitive Boolean algebra operations AND OR and NOT. These operations have corresponding logical gates which are available as DIP chips in the lab.

- The NOT gate is part number 7404
- The AND gate is part number 7408
- The OR gate is part number 7432

You will need to construct the truth table above as a configuration of logic gates such that the inputs A and B are provided by switches and the outputs C and S are visible on LEDs.

- To do this, you will need to construct the Boolean algebra equation for C and S using only the variables A and B.
- Using these equations you will modify them to use only the AND, OR and NOT operators.
- This equation will allow you to draw the gate diagram with the gates availible to you.
- Use this gate diagram and the IC pinouts provided at the end of the manual to construct the circuit.

Reminder:
- The part numbers on the chip may vary from chip to chip so ignore the letters.
- SN74HCT04 would be referred to simply as 7404.

### Latches, Flip-Flops and Registers

In the last lab, we looked at how we can construct a circuit for any given truth table. In this lab, we will look at how we can use this and some new parts to build other components of a computer. 

## Latches

A computer does not always require that the input for its operations be present at all times. It uses memory to hold inputs for when it needs them and can store results to memory for later. Latches provide the facility to do this and are build by a cross-coupled pair of NAND gates or NOR gates. Cross-coupling is when the output of one gate is used as the input for the other and vice-versa. This creates a feedback in the circuit which is used to store a one bit value. The other inputs allow the feedback to be changed thus changing the stored bit value. This is what is known as an R-S latch. It has two inputs (R and S) and two outputs (Q and ~Q).

| R | S | Latch Behavior | 
|:-:|:-:| -------------- |
| 0 | 0 | Retains value  |
| 1 | 0 | Stores a 0     |
| 0 | 1 | Stores a 1     |
| 1 | 1 | Undefined      |

The R-S latch does not provide the ideal means for sampling a value to store. For this, we add some logic in front of the RS latch to create a D latch. With the D latch we have inputs D and E which feed R and S so that when E is 0, we retain a value and when E is 1, we store the value on D.

| D | E | &bull; | R | S |
|:-:|:-:|:-:|:-:|:-:|
| X | 0 | = | 0 | 0 |
| 0 | 1 | = | 1 | 0 |
| 1 | 1 | = | 0 | 1 |

X in this case is used to denote the "Don't Care" input where the value can be either 0 or 1 for this particular output as when E is 0 we are retaining a value and D is not used under this case.

![Gate Diagram of D Type Latch](http://upload.wikimedia.org/wikipedia/commons/2/2f/D-Type_Transparent_Latch.svg)

In this part of the lab, you will construct a D type latch and test its ability to store a value.

![Example circuit for Lab 3](https://rawgithub.com/er1/s228/master/lab3_bb.svg)

## Flip-Flops

Latches are level-triggered which in the case of D latches, means that when the level of E is high (E = 1) it stores the value from D which may change change while E is high. This is not an ideal behaviour because we would like to sample a particular value at a particular time. This behavior is called edge-triggered and is the moment when a value changes in a particular direction. The positive edge or rising edge is when a value goes from 0 to 1 and the negative edge or falling edge is when a value goes from 1 to 0. 

A flip-flop is two chained D-type latches such that the D input for the second comes from the Q output of the first. E is inverted for the second one. This means that at all times, E is keeping the value locked for exactly one of the latches in the flip-flop.

[Wikipedia Page on Flip-Flops](http://en.wikipedia.org/wiki/Flip-flop_%28electronics%29)

#### To include in Lab Report 1

- An explanation of how data is represented electrically
- How logic gates relate to Boolean Algebra
- The equations that you have derived for the half-adder
- A gate diagram for those equations
- A truth table for a __full-adder__ circuit
- A gate diagram for and an explanation of a D latch

Lab reports are due two weeks after they are assigned. __Lab report 1 is due the week of February 10.__

There will be a 10% __deduction__ on the lab grade if you fail to include your name or group number on your report. There will be a 40% __deduction__ in lab grade if you fail to complete the labs before the lab report deadline.

## Troubleshooting 101

### Some pointers when building your circuit

1.  Always use a color convention!!! ( VCC = RED, Ground = BLACK)  `TIP : it will help you to use the same color when you want to propagate your clock signal throughout your breadboard`

2. Please use shorter wires when you want to connect something. Your breadboard will look much cleaner and will cause you less problems if you even need to do some debugging later on. If it shorts, it won't work.

3. Always try to wire your circuit as neatly as possible. 

### Troubleshooting

1. Make sure that you are using the correct chip and that its pins aren't bended. `TIP: some of the chips are being used for a second time, so the pins might already be bent or will bend when you push them in`

2. Check if your ground and power pins of all your logic chips are connected correctly.

3. During the construction of your circuit, you may have incorrectly  connected a cable. To find this error, you will need to create a "debugging cable". 
  * Connect 1 long red cable to a LED in series with a resistor. `IF YOU DO NOT ADD THE RESISTOR, IT WILL BURN THE LED. Since red is used for VCC in your color convention, no one will be mislead in error that it is a required cable in your circuit.`  
  *  When you will connect this cable to a random pin on your breadboard, it will show you its data.
  +  **E.G.** 
      You want to make sure that you have spread your clock signal correctly on your breadboard. `TIP: use the same color eg. GREEN`
      + Connect your 'debug cable' to a pin that is supposed to be receiving a clock signal. If your debug LED is not showing you the clock signal, then you have found your problem, however, if it is showing the correct pattern, then you can proceed to the next pin to be tested. 
      + This process can be used to verify if a chip is receiving the correct input or producing the good output. 
      + `Faulty chips can be found using this method`

4. You may also add more LEDs on you breadboard to show intermediate result. It could help you isolate problem later on. 

### Advanced Debugging with Arduino

Some parts of the lab may be difficult to debug with traditional techniques without modifications to the circuit. For example, the bus serves multiple purposes and contains different values each clock phase. To debug a certain phase, it may be useful to use an external circuit such as an Arduino to detect the wanted clock pulse and read the bus only during that micro operation. This can be achieved with the Arduino using it's interrupt functionality to execute the code reading probe lines only when the interrupt pin is activated. The included arduino code works by attaching a clock pulse to pin 2, and then using pins 4 through 7 as probes. Each time pin 2 is activated, it will print out the values of pins 4 to 7 over serial (To access the serial monitor in the Arduino IDE: Tools > Serial Monitor). For example, if one would want to debug that the programming counter is properly sending its value to the MAR latch, one could just connect pin 2 of the Arduino to pin 9 of the MAR, pin 4 (Arduino) to pin 13 (74175), and pin 5 to pin 12.

[Arduino code](https://rawgithub.com/Netopya/s228/master/ino/ArduinoInterruptDebugger/ArduinoInterruptDebugger.ino)

## Project Labs

At this phase, we will start building the lab project for the rest of the course. You may clear off everything on your project board up until now as it will not be needed. Pay close attention to wiring as from now on we will be keeping everything on the project until the end of the project and poor wiring will make locating mistakes in the lab much more difficult.

### System Clock / Clock Signal Generator

In this lab, you will be building system clock for your computer. The system clock is an alternating signal changing from 0 to 1 and back at a regular interval. This signal is used to provide a changing input which can be used to make the computer work autonomously. Without this signal, the computer would need the user to make a change in inputs for every phase of computation similarly to how in the preliminary labs, our outputs only ever changed when an input was changed.

The primary function of a CPU is to perform a set of operations called instructions. These instructions have an almost one-to-one relationship with lines of code in assembler language (which will be seen in the tutorial for this class) and perform operations such as copying a value from one register to another or more complex operations such as arithmetic and memory access. These instructions may need to occur in several phases so the system clock needs to be expanded into several clock signals where we will have one for each phase. In this lab, we will be constructing a fixed four phase clock generator (meaning that each instruction has four phases, even if some do not use all of them and that number is fixed).

We will introduce two new logic chips for this purpose.

- The 555 chip which is a chip used to control timing. We will wire it up in asynchronous mode so that it generates the alternating signal from one to zero. This setup uses an RC tank circuit to control the timing of the signal meaning the values of the resistors and capacitor control how fast the value changes.

- The 74164 chip which is a serial-in-parallel-out (SIPO) shift register. A SIPO shift register is a chip with several flip-flops chained up internally so that all the outputs of each flip-flop are accessible on their own pin and where the inputs are provided by the preceding flip-flop's output. The first input is made accessible on a pin which we use to shift values in.

We will be using the clock signal to generate a clock for the shift register so that it can shift values on its own. The value that we shift in will be based on the values that are already in the register and will be such that there is only one zero in the register (i.e. shifting in 1 unless the register contains all 1s).

![Example circuit for Lab 4](https://raw2.github.com/er1/s228/master/lab4_bb.png)

### Buses and Registers

In this lab, you will be building the CPU buses for your computer. A CPU bus is a common system such that registers can move values between each other. In this lab we will build two buses, one where all the registers outputs are attached to one of the ALU inputs, and one where the register inputs are attached to the ALU output. Since the ALU has two inputs, the remaining input will be attached to a controllable 0 or 1.

A Register is a Flop-Flop with a Tri-State buffer attached to make the output controllable. This gives a device which can be attached to a bus for both inputs and outputs. The register will read off the bus attached at its input just as a flip flop would when its enable line is triggered, this works because one output can feed several inputs. The Tri-State buffer allows the output to be controlled by electrically disconnecting it so that we can allow only one value to be output on the bus at a time. Without it, the bus would be attached to more than one output leading to conflicting signals on the bus.

[Wikipedia Page on Buses](http://en.wikipedia.org/wiki/Bus_(computing))

[Wikipedia Page on Registers](http://en.wikipedia.org/wiki/Processor_register)

...

![Example circuit for Lab 5](https://raw2.github.com/er1/s228/master/lab5_bb.png)

#### To include in Lab Report 2

- An explanation of why a clock signal is needed in a computer
- The relation between the clock signal and instruction phase signals and why we need instruction phases
  - The clock signal is the signal that alternates between zero and one
  - The phase signals are the four signals that we brought out to the LEDs
- How we derived the phase signals (hint: shift register and feedback)
  - hint: shift register and feedback
- An explanation of the general architecture of the computer
- Describe the functions of an ALU and compare it to what we have built in the lab
- Describe how one would perform the register transfer language operation A -> B

Lab reports are due two weeks after they are assigned. __Lab report 2 is due the week of March 10.__

There will be a 10% __deduction__ on the lab grade if you fail to include your name or __group number__ on your report. There will be a 40% __deduction__ in lab grade if you fail to complete the labs before the lab report deadline.

### Memory

In this lab, you will be building the RAM for your computer, it will be comprised of 4 registers selected through a decoder. This will give us a 4x4 memory unit with 4 data lines and 2 address lines.

In a computer, we only have a small number of registers to store data. Typically, we need to store much more information than the registers provide us. For this reason, we use main memory. Main memory is a large array of memory units (typically flip flops) that we can access by choosing which unit we want access to through a register and performing operations to that unit as we normally would to a register. This means we need two special purpose registers in our CPU. We have a Memory Address Register (MAR) which picks which memory unit we want to access using its address (similar to an index for an array) and a Memory Data Register (MDR) which exposes the contents of a particular memory address to the CPU. It is important to note that the MAR is a write only register since we only ever specify memory locations and the MDR is not actually a register but a means of exposing memory as a register.

We are using four register as our memory units in this lab. These registers are are selected though a decoder. The decoder gets an address from the MAR and uses it to select which register should be active.

In this lab, we will also be including our Instruction Register (IR) which will be used in the next lab.

...

![Example circuit for Lab 6](https://raw2.github.com/er1/s228/master/lab6_bb.png)

#### To include in Lab Report 3

- An explanation of how memory works
- The difference between registers and memory
- Did we build static memory or dynamic memory, what are the differences between them?
- How many address lines did we have and how many addresses did that give us?
- Assume that we are still using a 4 bit word size.  How many address lines and data lines would we need if we were to have had 8 words of memory? and for 16 words of memory?

Lab reports are due two weeks after they are assigned. __Lab report 3 is due the week of March 17.__

There will be a 10% __deduction__ on the lab grade if you fail to include your name or __group number__ on your report. There will be a 40% __deduction__ in lab grade if you fail to complete the labs before the lab report deadline.

`If you are unable to complete the lab before the deadline for technical reasons, there will be no grade penalty.` 
`Please inform your lab instructor before the deadline if this is the case`

### Control Unit

In this lab, we will be building the control unit for your computer. The control unit is what will control how the cpu handles machine language instruction.

`add1` = &not;( `phase1` &and; ( `phase3` &or; `ir1` ) )  
`pc out` = `phase1`  
`pc in` = `phase1`  
`a out` = `phase3` &or; &not;`ir4`  
`a in` = `phase3` &or; `ir2`  
`b out` = `phase3` &or; `ir4`  
`b in` = `phase3` &or; `ir3`  
`led latch` = `? in` &or; `clock`  
`mar latch` = `phase1` &or; `clock`

Notes: (1) You will need to remove any existing signals that were being fed to the chips that the control unit is not providing. This is to ensure that each input only gets one value.

(2) After implementing the control unit, the four LEDs that were previously counting might not be, this is normal. Attach `?_in` to `pc_in` and they should continue counting.

(3) To test if your mar latch and your led latch are latching or working correctly, you can attach a wire from the 9 pin of each latch to a working led light. Observe the resulting display patterns. Your mar latch light should act the same as your phase 1 light from your clock. Your led latch light should act the same as your phase 3 light from your clock. This means that your mar latch is latching at phase 1 and your led latch light is latching at phase 3. 

To verify if your equations are correct, you can debug the output of every equation by connecting each of them to a spare LED one by one, and changing the data in the instruction registers accordingly to verify its behaviour. For example, make your address lines fixed, and make every bit in the instruction register low except for `ir2`. If you verify the equation that is proposed for `a in`, this output must be always active when `ir2` is active. If you set `ir2` back to low again, `a out` should now become `phase3`. Similar logic can be applied to the output of `add1`, which becomes &not;`phase1` when `ir1` is active, and &not;(`phase1`&and;`phase3`) when `ir1` is low. If one of your outputs is not working correctly, backtrace them to the chips that are creating the equation. This is particularly important since WRONG CHIPS OFTEN END UP IN THE WRONG BOXES, AND CHIPS OFTEN HAVE A FEW PINS BURNT OUT. This is a way to correct these issues.

After implementing the control unit, the four LEDs that were previously counting might not be, this is normal. Attach `?_in` to `pc_in` and they should continue counting.

#### Signal description

* Lab 4: Clock Signal Generator
  - `phase1` is the first clock signal brought out to the LEDs 
  - `phase2` is the second clock signal brought out to the LEDs 
  - `phase3` is the third clock signal brought out to the LEDs 
* Lab 5: Registers
  - `add1` is pin 6 on the 74283  
  - `pc in` is pin 9 on the 74173 representing the PC register 
  - `pc out` is pin 1 on the 74173 representing the PC register 
  - `a in` is pin 9 on the 74173 representing the A register 
  - `a out` is pin 1 on the 74173 representing the A register 
  - `b in` is pin 9 on the 74173 representing the B register 
  - `b out` is pin 1 on the 74173 representing the B register 
  - `led latch` is pin 9 on the 74175 
* Lab 6: Memory
  - `mar latch` is pin 9 on the 74175 representing the MAR 
  - `ir1` comes from the bit 1 in the instruction register 
  - `ir2` comes from the bit 2 in the instruction register 
  - `ir3` comes from the bit 3 in the instruction register 
  - `ir4` comes from the bit 4 in the instruction register 

##### Signal names

- `ir1`: `+1`
- `ir2`: `Ain`
- `ir3`: `Bin`
- `ir4`: `Bout`/&not;`Aout`

### Running a Program

In this lab, we will store a program in memory and have your computer run it.

In the previous lab, we set up the control unit to have the computer control how data was moving through the bus. The control unit used a machine language instruction along with a the clock signal phase to control which registers were storing values and which output their value to control the data flow from the registers.

Recall that in the last lab, we assigned names to the bits of the instruction register (`ir3` became `Bin` and so on). These names were given since they signify a particular signal is to be active when that bit is active.

If we create a table of all the combinations for the instruction register, we can see which signals should be active for that instruction register value. With that knowledge we can see which registers are moving values and then derive register transfer notation for each of our instruction and subsequently name them accordingly.

We only want to look at the signals active during phase3 since phase1 is always adding one to PC and reading the instruction.

| Value &dagger; | Active signals                | Transfer Notation | Instruction Name |
| ----- | ----------------------------- | ----------------- | ---------------- |
| 0000 | `add1`, `a in`, `b in`, `b out` | B + 1 -> A, B    | *        |
| 0001 |         `a in`, `b in`, `b out` | B -> A, B        | *        |
| 0010 | `add1`,         `b in`, `b out` | B + 1 -> B       | Inc B    |
| 0011 |                 `b in`, `b out` | B -> B           | NOP      |
| 0100 | `add1`, `a in`,         `b out` | B + 1 -> A       | *        |
| 0101 |         `a in`,         `b out` | B -> A           | Mov A, B |
| 0110 | `add1`,                 `b out` | B + 1 -> &empty; | *        |
| 0111 |                         `b out` | B -> &empty;     | *        |
| 1000 | `add1`, `a in`, `b in`, `a out` | A + 1 -> A, B    | *        |
| 1001 |         `a in`, `b in`, `a out` | A -> A, B        | *        |
| 1010 | `add1`,         `b in`, `a out` | A + 1 -> B       | *        |
| 1011 |                 `b in`, `a out` | A -> B           | Mov B, A |
| 1100 | `add1`, `a in`,         `a out` | A + 1 -> A       | Inc A    |
| 1101 |         `a in`,         `a out` | A -> A           | *        |
| 1110 | `add1`,                 `a out` | A + 1 -> &empty; | *        |
| 1111 |                         `a out` | A -> &empty;     | *        |

&dagger; Value is in the order: `ir4` `ir3` `ir2` `ir1`

( * ) Undocumented Instruction: Instruction not intended for use

#### Testing

We need to verify that all our defined instructions (`Inc B`, `Mov A, B`, `Mov B, A`) work. To do this we program that instruction into memory and check if it behaves as it should. In the case of `Inc A` which cause A to increase by one, we would need to attach `?_in` to `a_in` so that the LED latches the value of A so that we can see if A is in fact counting up by one.

Once all the instructions work, program a simple program into memory. The instruction register will need to latch instruction from memory based on the address stored in the program counter. This means that the MAR cannot be attached to the switches used for programming. Instead, the MAR should be attached to the in-bus. To do this, move the wires on pins 4 and 5 on the MAR flip-flop so that they connect to pins 4 and 5 on the LED flip-flop. Pins 4 and 5 on the LED flip-flop connect to the lower order bits on the in-bus.

#### Final Program

Program into memory the following program:

```AsciiDoc
MOV A, B
INC B
MOV B, A
INC B
```

`? in` in lab 7 should be attached to `b in` so that the lab instructor can see the value stored in register B and verify the proper running of the program.

#### To include in Lab Report 4

__SUBJECT TO CHANGE__

- The architecture of the computer
- A description of what the control unit does
- The functionality of the control unit implemented in the lab
- How a program was loaded into memory
- How a program in memory was run

Lab report deadline will be discussed during the lab session.

There will be a 10% __deduction__ on the lab grade if you fail to include both your name or group number on your report. There will be a 40% __deduction__ in lab grade if you fail to complete the labs before the lab report deadline.

<!--
#### To include in Lab Report 5
__SUBJECT TO CHANGE__
- A short post mortem on what you have learned in the lab, what you had difficulties with and what you might fix
OR
- Lab topics (talk to your lab instructor for more information)
-->

# Description of Chips Used

The part numbers on the chips may vary from chip to chip. For this project, the parts have been picked so that you may ignore the letters in the part number. This means the parts SN74HCT04 and 74LS04 would be referred to simply as 7404 and perform the same task.

Chips are numbered counter-clockwise starting at the notch on the chip (on the top of the diagram).

## [555 Timer](http://en.wikipedia.org/wiki/555_timer_IC)

The 555 Timer Chip is a chip used to generate various output waveforms. For our purpose, we will be using it to generate our clock signal in the Clock Signal Generator lab. In depth knowledge of this chip is not needed for this course.  However, more information can be found on the [555 Timer IC Wikipedia page](http://en.wikipedia.org/wiki/555_timer_IC).

```AsciiDoc
        .-._.-.
 GND   [|     |]   VCC
TRIG   [| 555 |]   DIS
 OUT   [|     |]   THR
~RES   [|     |]   CTRL
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `OUT`: Output waveform
- `TRIG`, `RES`, `CTRL`, `THR`, `DIS`: These pins determine how the chip should generate its output waveform.

## 7404 NOT Gate (x6)

The 7404 is a chip that contains 6 NOT gates, also known as inverters.

`Yn` = ~`An`

```AsciiDoc
        .-._.-.
  A4   [|     |]   VCC
  Y4   [| 74  |]   A1
  A5   [|  04 |]   Y1
  Y5   [|     |]   A2
  A6   [|     |]   Y2
  Y6   [|     |]   A3
 GND   [|     |]   Y3
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `A#`: Input for correspondingly numbered gate
- `Y#`: Output for correspondingly numbered gate

## 7408 AND Gate (x4) 

The 7408 is a chip that contains 4 AND gates.

`Yn` = `An` &and; `Bn`

```AsciiDoc
        .-._.-.
  A3   [|     |]   VCC
  B3   [| 74  |]   A1
  Y3   [|  08 |]   B1
  A4   [|     |]   Y1
  B4   [|     |]   A2
  Y4   [|     |]   B2
 GND   [|     |]   Y2
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `A#`: First Input for correspondingly numbered gate
- `B#`: Second Input for correspondingly numbered gate
- `Y#`: Output for correspondingly numbered gate

## 7432 OR Gate (x4)

The 7432 is a chip that contains 4 OR gates.

`Yn` = `An` &or; `Bn`

```AsciiDoc
        .-._.-.
  A3   [|     |]   VCC
  B3   [| 74  |]   A1
  Y3   [|  32 |]   B1
  A4   [|     |]   Y1
  B4   [|     |]   A2
  Y4   [|     |]   B2
 GND   [|     |]   Y2
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `A#`: First Input for correspondingly numbered gate
- `B#`: Second Input for correspondingly numbered gate
- `Y#`: Output for correspondingly numbered gate

## 7442 Decoder

```AsciiDoc
        .-._.-.
   0   [|     |]   VCC
   1   [| 74  |]   A1
   2   [|  42 |]   A2
   3   [|     |]   A3
   4   [|     |]   A4
   5   [|     |]   9
   6   [|     |]   8
 GND   [|     |]   7
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `A#`: Input bit `n` of a binary number
- `#`: Output pin would be 0 if `A1`-`A4` match `#`. Otherwise, it would be 1.

| A4 | A3 | A2 | A1 | &bull; | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | = | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 0 | 1 | = | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 0 | = | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | = | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 0 | = | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | = | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 |
| 0 | 1 | 1 | 0 | = | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |
| 0 | 1 | 1 | 1 | = | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 0 | = | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | = | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 |

## 74164 Shift Register

```AsciiDoc
        .-._.-.
 In1   [|     |]   VCC
 In2   [| 74  |]   Q8
  Q1   [| 164 |]   Q7
  Q2   [|     |]   Q6
  Q3   [|     |]   Q5
  Q4   [|     |]   ~RES
 GND   [|     |]   CLK
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `In1`, `In2`: Input bit to shift in on the next rising edge (transition from 0 to 1) of `CLK`
- `Q#`: Output pin containing the current stored value
- `RES`: Reset all values to 0

On shift, the value in `In1` &and; `In2` will be stored in `Q1`, `Q2` will contain the previous value of `Q1`, `Q3` will contain the previous value of `Q2` and so on until `Q8`.

## 74173 4 bit Register

```AsciiDoc
        .-._.-.
~OE1   [|     |]   VCC
~OE2   [| 74  |]   RES
  Q1   [| 173 |]   D1
  Q2   [|     |]   D2
  Q3   [|     |]   D3
  Q4   [|     |]   D4
 CLK   [|     |]   ~In1
 GND   [|     |]   ~In2
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `D#`: Inputs to Latch on `CLK` rising edge
- `Q#`: Outputs of register on `OE1` and `OE2`
- `In1`, `In2`: Enable this to store values from `D#` on the next rising edge of `CLK`
- `OE1`, `OE2`: Enable this to output values from `Q#`
- `CLK`: Clock signal
- `RES`: Reset all values to 0

## 74175 4 bit Flip-Flop

```AsciiDoc
        .-._.-.
~RES   [|     |]   VCC
  Q2   [| 74  |]   Q3
 ~Q2   [| 175 |]   ~Q3
  D2   [|     |]   D3
  D1   [|     |]   D4
 ~Q1   [|     |]   ~Q4
  Q1   [|     |]   Q4
 GND   [|     |]   CLK
        '-----'
```

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `D#`: Inputs to Latch on `CLK` rising edge
- `Q#`: Outputs of Flop-Flop
- `CLK`: Clock signal to latch on rising edge
- `RES`: Reset all values to 0

## 74283 4 bit Adder

```AsciiDoc
        .-._.-.
  S2   [|     |]   VCC
  B2   [| 74  |]   B3
  A2   [| 283 |]   A3
  S1   [|     |]   S3
  A1   [|     |]   A4
  B1   [|     |]   B4
 Cin   [|     |]   S4
 GND   [|     |]   Cout
        '-----'
```

# PIN Enumeration

Pin are numberd in an anticlockwise fashion like so:

```AsciiDoc
        .-._.-.
   1   [|     |]   16
   2   [| 74  |]   15
   3   [| 173 |]   14
   4   [|     |]   13
   5   [|     |]   12
   6   [|     |]   11
   7   [|     |]   10
   8   [|     |]   9
        '-----'
```


# Test Area

```AsciiDoc
        .-._.-.
       [|     |]
       [|     |]
       [|     |]
       [|     |]
        '-----'
```

