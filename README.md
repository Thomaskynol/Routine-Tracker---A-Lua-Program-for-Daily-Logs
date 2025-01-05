# Routine Tracker

## Overview
The **Routine Tracker** is a Lua-based application designed to help you log, evaluate, and score your daily activities. It allows you to input information about your professional, health, leisure, and social life, then calculates a score based on predefined values and stores it in a JSON file.

You can log your day in real-time or enter logs for any past date. The program evaluates your day by asking you questions about various aspects of your life and provides a score based on your responses.

## Features
- Log data for today or any past date
- Questions to evaluate different aspects of your day (work, health, leisure, etc.)
- Store logs as JSON files for easy access and analysis
- Calculate a daily score based on your inputs
- View the score of any previous day's log

##Install LuaRocks and lua-cjson
- Begin by setting up LuaRocks, the package manager for Lua,
- and the lua-cjson module for efficient JSON handling. These are essential for the program's functionality.

## How to Use
1. **Run the Program**: Launch the application by opening main.lua (for Lua environments) or routineTracker.exe (for standalone execution).
2. **Choose an Option**:
    - Register today's data or data from another day.
    - View the score for any specific day by selecting the date.
3. **Answer the Questions**: For each log, you will be asked questions about various aspects of your day. The questions are grouped into categories like professional, health, relationships, and more.
4. **Review the Score**: After logging your day, the program will calculate and display a score based on your responses.

