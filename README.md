# Assembly Sort Program

## Overview

This project implements a simple sorting algorithm in x86 assembly language. The program initializes an array of integers, sorts them in ascending order, and then halts. The sorting is performed using a pairwise comparison method, ensuring that all elements are processed through nested loops.

## Features

- Initializes an array of integers.
- Sorts the array in ascending order using a comparison and swapping method.
- Designed to run in a DOS environment.

## Code Explanation

### Main Components

- **Array Initialization**: The program initializes an array of integers directly in the assembly code.
- **Sorting Logic**: It employs nested loops to compare and swap elements until the entire array is sorted.

### Key Instructions

- `MOV`: Moves data from one location to another.
- `CMP`: Compares two values.
- `JAE` / `JB`: Conditional jumps based on comparison results.
- `LOOP`: Decrements the loop counter and jumps if it's not zero.
- `HLT`: Halts the program execution.

## Usage

This assembly program can be used for educational purposes to demonstrate how sorting algorithms work at a low level. It provides insights into assembly programming, including memory management and control flow.
