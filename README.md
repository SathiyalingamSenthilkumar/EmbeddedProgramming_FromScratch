Description
 
 - The objective of this project is to develop an embedded bare-metal application 
 from scratch with GNU cross-compiler tool chain (Without IDE).
 - The microcontroller choosen for this purpose is STM32F407VGT from ST Microelectronics
 - The microcontroller is based on Arm® Cortex®-M4 32-bit processor.
 - The different steps include:
		- Writing the startup file from scratch.
		- Writing the Linker script from scratch.
		- Automize the build system using GNU Make
		- Using openOCD and GDB client for programming the microcontroller.

A simple program that was written before which involves configuring the SysTick timer of the 
processor is taken here as the main program. This application was written previously using 
STM32CubeIDE as a practice for configuring the SysTick timer. This application is now taken
for simplicity.