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

`Describe Architecture`

# Project Componenents

## Power Supply

In this project we will be using a standard 5 volt direct current power supply. We will be using the positive connection to connect to our supply rail called `VCC` and is by convention red. The negative connection will connect to our reference rail called ground or `GND` and is by convention black but may appear at times in blue.

In this lab, we will use `VCC`, `5V` and `+5V`

## Breadboard
## Wires
## Integrated Circuit Chips
## Passive Components
### Resistor
### Capacitor
## Light Emitting Diodes
## Switches

# Data Representation

Inside the computer, we need a way of representing information, however, the only means we have is through wires. The information we can store on a wire is called a bit and is the absense or presence of a voltage relative to a common reference. The convention we have adopted is that the presence of a voltage represents a logical `1` and the absense of a volatage is a logical `0`

## Binary

Decimal | Binary
:-:|:-:
0 | `0000`
1 | `0001`
2 | `0010`
3 | `0011`
4 | `0100`
5 | `0101`
6 | `0110`
7 | `0111`
8 | `1000`
9 | `1001`
10 | `1010`
11 | `1011`
12 | `1100`
13 | `1101`
14 | `1110`
15 | `1111`

# Logic Gates


# Description of Chips Used

## 555 Timer
## 7404 NOT Gate (x6)
## 7408 AND Gate (x4) 
## 7432 OR Gate (x4)
## 7442 Decoder
## 74164 Shift Register
## 74189 64bit Memory (16x4)
## 74283 4bit Adder
## 74395 4bit Register

# Project 

## Introductory Labs

### Equipment and Data Representation
### Circuits using Logic ICs (Half Adder)

```
  A
+ B
---
 CS
```

| A | B | C | S |
|:-:|:-:|:-:|:-:|
| `0` | `0` | `0` | `0` |
| `0` | `1` | `0` | `1` |
| `1` | `0` | `0` | `1` |
| `1` | `1` | `1` | `0` |

## Project Labs

### System Clock
### Buses and Registers
#### Flip Flops
#### Tri-State Buffer
### Memory
### Control Unit
### Running a Program


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

```AsciiDoc
        .-._.-.
 GND   [|     |]   VCC
TRIG   [| 555 |]   DIS
 OUT   [|     |]   THR
~RES   [|     |]   CTRL
        '-----'
```
