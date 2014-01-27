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

In this project you will be building a simple computer with a central processing unit with support for a few instruction and some memory. The instructions that will be built are simple operations such moving data between registers and performing simple addition operations.

By the end of the project, your computer should be able to demonstrate the operation of the following program:

```AsciiDoc
MOV A, B
INC B
MOV B, A
INC B
```

# Project Components

## Power Supply

In this project, we will be using a standard 5 volt direct current power supply. We will be using the positive connection to connect to our supply rail called `VCC` and is by convention red. The negative connection will connect to our reference rail called ground or `GND` and is by convention black but may appear at times in blue.

In this lab, we will use `VCC`, `5V` and `+5V`

## Breadboard

In this project, we will be using a prototyping project board more commonly known as a breadboard. It contains small holes which share an electronic connection with holes in the same row or column. There are two areas on the breadboard: the prototyping area and the supply rails.

The prototyping area located in the middle is where you will place the components in this project. The prototyping area has a grid of holes, identified by a letter and number written on the top and side. These holes are electrically connected in a line of five (i.e. pins 1A through 1E are all connected but not to 1F or 2A). There is a gap in the middle which will be where you put the center of your DIP (Dual Inline Package) components so that you can make connections to their pins.

The supply rails are arranged in two rows connected in a long line with a red or blue stripe next to them. They are electrically connected as indicated by the line next to them (i.e. a break in the line means a break in the connection). These are used for your power supply connection and you should attach them to `VCC` or `GND` for red and blue respectively.

![A breadboard graphic](https://rawgithub.com/er1/s228/master/breadboard.svg)

## Wires

We will be using 22 gauge solid core copper wire for this project.

The wires should be properly cut and the plastic insulation must be stripped from the inner conductor before use. The amount of insulation stripped should nominally expose 6mm (1/4 inches) of wire.

## Integrated Circuit Chips

We will be using standard 300mil plastic Dual Inline Package (DIP) Integrated circuit chips for this project.

## Passive Components
### Resistor
### Capacitor
## Light Emitting Diodes
## Switches

# Data Representation

Inside the computer, we need a way of representing information, however, the only means we have is through wires. The information we can store on a wire is called a bit and is the absence or presence of a voltage relative to a common reference. The convention we have adopted is that the presence of a voltage represents a logical `1` and the absence of a voltage represents a logical `0`

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
- This equation will give allow you to draw the gate diagram with the gates availible to you.
- Use this gate diagram and the IC pinouts provided at the end of the manual to construct the circuit.

Reminder:
- The part numbers on the chip may vary from chip to chip so ignore the letters.
- SN74HCT04 would be referred to simply as 7404.

#### To include in the lab report

- The equations that you have derived for the half-adder.
- A gate diagram for those equations.
- A truth table for a __full-adder__ circuit

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

Latches are level triggered which in the case of D latches, means that when the level of E is high (E = 1) it stores the value from D which may change change while E is high. This is not an ideal behaviour because we would like to sample a particular value at a particular time. This behavior is called edge-triggered and is the moment when a value changes in a particular direction. The positive edge or rising edge is when a value goes from 0 to 1 and the negative edge or falling edge is when a value goes from 1 to 0. 

A flip-flop is two chained D type latches such that the D input for the second comes from the Q output of the first. E is inverted for the second one.

[Wikipedia Page on Flip-Flops](http://en.wikipedia.org/wiki/Flip-flop_%28electronics%29)

## Project Labs

### System Clock / Clock Signal Generator

![Example circuit for Lab 4](https://rawgithub.com/er1/s228/master/lab4_bb.svg)

### Buses and Registers
#### Flip Flops
#### Tri-State Buffer
### Memory
### Control Unit
### Running a Program

# Description of Chips Used

The part numbers on the chips may vary from chip to chip. For this project, the parts have been picked so that you may ignore the letters in the part number. This means the parts SN74HCT04 and 74LS04 would be referred to simply as 7404 and perform the same task.

## 555 Timer

The 555 Timer Chip is a chip used to generate various output waveforms, for our purpose, we will be using it to generate out clock signal the Clock Signal Generator lab. In depth knowledge of this chip is not needed for this course however more information can be found on the [555 Timer IC Wikipedia page](http://en.wikipedia.org/wiki/555_timer_IC).

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
- `TRIG`, `RES`, `CTRL`, `THR`, `DIS`: This pins determine how the chip should generate its output waveform.

## 7404 NOT Gate (x6)

The 7404 is a chip which contains 6 NOT gates also know as inverters.

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

The 7408 is a chip which contains 4 AND gates.

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

The 7432 is a chip which contains 4 OR gates.

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
- `#`: Output pin will be 0 if `A1`-`A4` match `#` otherwise it will be 1

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
- `In1`, `In2`: Input bit to shift in on on next rising edge (transition from 0 to 1) of `CLK`
- `Q#`: Output pin containing the current stored value

On shift the value in `In1` &and; `In2` will be stored in `Q1`, `Q2` will contain the previous value of `Q1`, `Q3` will contain the previous value of `Q2` and so on until `Q8`.

## 74173 4 bit Register

```AsciiDoc
        .-._.-.
 OE1   [|     |]   VCC
 OE2   [| 74  |]   CLR
  Q1   [| 173 |]   D1
  Q2   [|     |]   D2
  Q3   [|     |]   D3
  Q4   [|     |]   D4
 CLK   [|     |]   In1
 GND   [|     |]   In2
        '-----'
```

<!-- check with datasheet -->

- `VCC`: +5V Supply Voltage
- `GND`: Ground
- `D#`: Inputs to Latch on `CLK` rising edge
- `Q#`: Outputs of register on `OE1` and `OE2`
- `In1`, `In2`: Enable this to store values from `D#` on the next rising edge of `CLK`
- `OE1`, `OE2`: Enable this to output values from `Q#`
- `CLK`: Clock signal

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

# Test Area

```AsciiDoc
        .-._.-.
       [|     |]
       [|     |]
       [|     |]
       [|     |]
       [|     |]
       [|     |]
       [|     |]
       [|     |]
        '-----'
```

## [555 Timer IC](http://en.wikipedia.org/wiki/555_timer_IC)
```AsciiDoc
        .-._.-.
 GND   [|     |]   VCC
TRIG   [| 555 |]   DIS
 OUT   [|     |]   THR
~RES   [|     |]   CTRL
        '-----'
```
