/**
 ******************************************************************************
 * @file           : startup_STM32F407.c
 * @author         : Sathiya Lingam Senthil Kumar <slsathiya20@gmail.com>
 * @brief          : Linker script for STM32F407
 *                      - 1024Kbytes FLASH
 *                      - 128Kbytes RAM.
 *					 The Linker script is responsible for merging the different
					 sections of the object file.
 *            
 ******************************************************************************
 */
 
/* Entry Point */
ENTRY(Reset_Handler)

/* Memory Definitions */
MEMORY
{
  FLASH    (rx)    : ORIGIN = 0x08000000,   LENGTH = 1024K
  SRAM     (xrw)   : ORIGIN = 0x20000000,   LENGTH = 128K
}