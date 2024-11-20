# Number Guessing Game - Assembly Language Code Explanation

This assembly program implements a simple **Number Guessing Game** using x86 assembly language. It includes a variety of macros and procedures to manage screen display, user input, and game logic. Here's a breakdown of the code structure and its functionality:

---

## **Table of Contents**

1. [Introduction](#introduction)
2. [Macros](#macros)
3. [Data Section](#data-section)
4. [Code Section](#code-section)
5. [Procedures](#procedures)
6. [Game Logic](#game-logic)

---

### **Introduction**

The program is an interactive number-guessing game where:

- One player enters a hidden number.
- The other player gets three attempts to guess the number.
- Messages are displayed based on the outcome: **WIN**, **FALSE**, or **LOSE**.

The code uses low-level I/O interrupts (INT 10h and INT 21h) for display and input operations.

---

### **Macros**

The code defines reusable macros for common operations:

1. **`SetResolution`**  
    Configures a specific screen area and background color.  
    **Parameters:** `srow, scol, erow, ecol, attrib`  
    Example:
   ```assembly
   SetResolution 0, 0, 24, 79, 45h ; Set screen background color
   ```
   2. **`setCursor`**
      Positions the cursor at a specific row and column.
      Parameters: row, col
      Example:

assembly
Copy code

`setCursor 8, 21 ; Set cursor to row 8, column 21`

## Game Logic

Player 1 enters a hidden number.
Player 2 is prompted to guess the number within three attempts.
The program evaluates the guesses and displays:
WIN if the guess matches the hidden number.
FALSE if the guess is incorrect (repeats for remaining attempts).
LOSE if all three attempts are incorrect.
Usage Instructions
Assemble the program using an x86 assembler like MASM or TASM.
Run the compiled program in a DOS emulator or real-mode environment.
Follow on-screen instructions to play the game.

## Contributors

`Shahzaib Faisal (2212349)`
`Aatir Raza (221217)`

# File Information

`Filename: NumberGuessingGame.asm`
