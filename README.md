# Digital Alarm Clock Project

## Introduction
This project is a **Digital Alarm Clock** designed and implemented using the **Digital simulation tool** and **Verilog**. The clock operates in a **24-hour format (HH:MM:SS)**, allowing users to **view the current time, set the time, and configure an alarm**. The design follows a **modular and hierarchical approach**, ensuring efficiency, scalability, and ease of debugging.

## Features
- **24-Hour Time Format:** Displays hours, minutes, and seconds.
- **Alarm Functionality:** Set an alarm that rings when the current time matches the alarm time.
- **Mode Selection:** Three operational modes:
  - **Display Time** (default mode)
  - **Set Clock** (update the current time)
  - **Set Alarm** (configure alarm time)
- **User Input via Buttons:**
  - Numeric keys for setting time
  - **ENTER** to confirm input
  - **ESC** to cancel input
  - **Alarm Toggle** to enable/disable the alarm
- **7-Segment Display:** Shows the time in real-time.
- **Reset Functionality:** Manual reset restores default values.

## Design Approach
The project uses a **combination of Digital tool components and Verilog modules** for efficiency and clarity. Major subsystems include:

### Key Components
1. **Clock Scaler:** Generates a **1 Hz** signal from the **1024 Hz input** for timekeeping.
2. **Time Counters:** Manages incrementing and resetting **seconds, minutes, and hours**.
3. **Alarm Comparator:** Activates the alarm when the current time matches the alarm time.
4. **Keyboard Control:** Handles button inputs for time and alarm settings.
5. **Mode Control Logic:** Implements mode switching via registers and MUX components.
6. **Validation Logic:** Ensures only valid time and alarm inputs are accepted.
7. **Alarm Handling:** Controls alarm enable/disable, reset, and output functions.

## System Block Diagram
The system follows a **hierarchical design**, where the central **Brain Module** processes inputs and manages interactions between subsystems.

## Functional Testing
The project was tested under various scenarios, and the following features were verified:

1. **Time Display:**
   - Proper second, minute, and hour increments.
   - Accurate updates on the 7-segment display.
2. **Set Clock Mode:**
   - Numeric keys update the clock time.
   - **ESC** cancels changes; **ENTER** confirms valid input.
3. **Set Alarm Mode:**
   - Numeric keys configure alarm time.
   - Alarm can be toggled ON/OFF.
4. **Alarm Trigger:**
   - Alarm activates at **HH:MM**, ignoring seconds.
   - LED blinks and buzzer sounds correctly.
5. **Input Validation:**
   - Prevents invalid time and alarm settings.
   - Reverts to the previous valid time when incorrect input is given.
6. **Reset Functionality:**
   - **Manual Reset** clears time and alarm settings.
   - **Auto-Reset** stops the alarm after 1 minute if not disabled manually.

## Challenges Faced
1. **Clock Division Complexity:**
   - Creating an accurate **1 Hz signal** required precise logic.
   - Using **counter components** simplified the process.
2. **Mode Transitions:**
   - Implementing **smooth state transitions** without unintended behavior.
   - **Registers and MUX components** streamlined the logic.
3. **Alarm Handling:**
   - Managing alarm enable/disable states and timers.
   - **Digital tool counters and comparators** made implementation easier.
4. **7-Segment Display Mapping:**
   - Splitting and displaying digits correctly.
   - **Splitters and MUX components** helped structure the output.

## Key Takeaways
- **Balance Between Verilog and Digital Tool Components:**
  - **Verilog:** Simplified complex logic like time setting.
  - **Digital Tool:** Managed input handling and mode control efficiently.
- **Hierarchical Design:**
  - Dividing into subsystems improved clarity and debugging.
- **Efficient Testing & Debugging:**
  - **Probes and LED indicators** simplified signal monitoring.

## Conclusion
This project successfully integrates **graphical simulation with Verilog programming**, demonstrating **real-time clock functionality** with an interactive **alarm system**. The design highlights **clock management, state machines, alarm handling, and user input validation**, providing a structured approach to digital design.

