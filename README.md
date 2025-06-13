# 🕹️ 8051 Multitasking System with Game & Hardware Integration

This repository contains the implementation of a **cooperative and preemptive multitasking system** for the **8051 microcontroller**, developed across five progressive checkpoints. The project showcases OS-level concepts like thread scheduling, synchronization, and real-time hardware interaction on resource-constrained embedded systems.

---

## 📌 Checkpoint Overview

### ✅ Checkpoint 1: Cooperative Multitasking
- Implemented basic cooperative threading system.
- Generated `.hex` and `.map` files for EdSim51.
- ⚠️ Warning noted: *unreferenced function argument `fp` in ThreadCreate*.

### ✅ Checkpoint 2: Preemptive Multitasking
- Added Timer 0 interrupt-based preemptive scheduling.
- Verified:
  - ISR jump at address `0x000B`
  - Stack pointer (SP) changes
  - Regular context switching

### ✅ Checkpoint 3: Producer-Consumer Problem
- Solved bounded buffer problem using semaphores:
  - `mutex` for critical section
  - `empty` and `full` for buffer state
- Validated via UART output and memory map analysis.

### ✅ Checkpoint 4: Fair Scheduling
- Introduced round-robin scheduling with direction alternation.
- Demonstrated:
  - Starvation in unfair version
  - Fairness in alternating producer output
- Analyzed thread creation order and scheduling behavior.

### ✅ Checkpoint 5: Dinosaur Game (Hardware Integration)
- Created a real-time dinosaur game using:
  - Button bank and keypad input
  - LCD for visual display
- Implemented:
  - Collision detection
  - Score tracking
  - Obstacle generation
  - Difficulty progression
- Race condition handled via `EA=0` and shared variable protection.

---

## 🛠️ Compilation Instructions
$ make clean   # (Ignore file-not-found errors)
$ make         # Compile project and generate .hex/.map

Each checkpoint includes:
- Source files (.c)
- Makefile
- Screenshots of build output and execution

🔑 Key Technical Concepts
- Thread Management
- Stack and register initialization
- Context switching (manual & interrupt-based)
- Thread lifecycle (creation, exit)
- Synchronization
- Semaphores for mutual exclusion and condition sync
- Scheduling fairness through round-robin logic

Hardware Interaction
- UART: for serial debugging
- Buttons & Keypad: for input handling
- LCD: for graphical game output with custom symbols

Game Design
- Bitmap game state representation
- Bit-shifted obstacle rendering
- Debounced inputs for responsive controls

🧪 How to Run / Test
- Load .hex file into EdSim51
- Checkpoints 1–4: Observe UART terminal output
- Checkpoint 5: Use keypad/buttons to control character and observe game on LCD
