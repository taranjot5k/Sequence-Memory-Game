# Sequence Memory Game

## Description
The Sequence Memory Game is an interactive FPGA-based design project aimed at challenging users to memorize and replicate sequences using both numbers and letters across five levels. Built for the DE10 Lite board, which is powered by an FPGA, this game leverages the unique capabilities of FPGAs for real-time processing and interaction. FPGAs allow for high customization and efficiency in handling the game's combinational and sequential logic, making it possible to create a dynamic and engaging experience. Users physically interact with the game through buttons, LEDR displays, and switches on the FPGA board. The goal is to engage users in a fun and challenging way to test their memory and attention to detail, showcasing the versatility and power of FPGA technology in creating interactive digital projects.

## How It Works

### Hardware Requirements
- DE10 Lite board

### Combinational & Sequential Logic
- **Combinational Logic**: Utilized for sequence evaluation by comparing the player's input with the stored sequence in registers bit by bit. It also controls the LEDR displays to show the correct sequence of lights and handles game initialization.
- **Sequential Logic**: Employs registers for sequence memory, allowing the game to store each level's sequence for the player to memorize. It's also used for scorekeeping and game management, including detecting completed sequences and displaying feedback on the player's input.

## Testable Features

### Combinational Logic
- **Input-Output Matching**: Ensures the correct LEDR lights up corresponding to each switch input.
- **Instant Feedback**: The game recognizes and indicates correct or incorrect sequences without delay.
- **Error Detection**: Identifies and signals any incorrect sequence inputs immediately.

### Sequential Logic
- **Memory Retention**: Confirms the consistent storage of sequences across levels.
- **State Transitions**: Validates smooth progression through the game's stages.
- **Timing Accuracy**: Guarantees precise control over the display of sequences and response times.
- **Score Update**: Accurately tracks and displays scores after each level.

## How to Play
1. **Starting the Game**: Use the button on the DE10 Lite board to begin. The game initiates with a brief introduction sequence on the LEDR display.
2. **Watching the Sequence**: Pay attention to the sequence shown on the LEDR's. The game will display a series of numbers and letters, increasing in complexity with each level.
3. **Repeating the Sequence**: Use the switches on the DE10 Lite board to replicate the shown sequence. Each switch corresponds to a specific number or letter displayed by the LEDRs.
4. **Submitting Your Answer**: After inputting the sequence, press the second button to submit your answer.
5. **Advancing Through Levels**: If the sequence is correctly inputted, you'll move on to the next level. The game tracks your progress and adjusts the difficulty accordingly.

## Files Description
- `ClockDividerFAST.v` & `ClockDividerSLOW.v`: Modules for controlling the timing of sequences displayed to the player.
- `DE10_LITE_Golden_Top.v`: The top module that integrates all components of the game.
- `display.v` & `displayLetters.v`: Modules responsible for displaying numbers and letters on the LEDR's.
- `lfsr10bit.v`: A module for generating random sequences using a linear-feedback shift register.
- `project.v`: The main project file that combines all functionalities of the Sequence Memory Game.

## Installation
Clone this repository to your local machine and open the project in Quartus Prime software. Ensure you have the DE10 Lite board connected and configured properly before downloading the project to the board.
