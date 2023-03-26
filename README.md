# Description
 
- The objective of this project is to develop an embedded bare-metal application
 from scratch with GNU cross-compiler tool chain (without IDE).
- The microcontroller chosen for this purpose is STM32F407VGT from ST Microelectronics.
- The microcontroller is based on Arm® Cortex®-M4 32-bit processor.
- The main focus of the project includes:
    - Writing the startup file from scratch.
	- Writing the Linker script from scratch.
	- Automating build system using GNU Make
	- Using openOCD and GDB client for debugging.
- The main program uses the SysTick timer (interrupt mode) to blink a few LEDs.
