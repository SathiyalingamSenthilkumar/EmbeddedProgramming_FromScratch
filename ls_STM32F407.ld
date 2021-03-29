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

/* Sections Definitions*/
SECTIONS
{
  .text :
  {	
    *(.isr_vector)
    *(.text)
	*(.rodata)
	. = ALIGN(4);       /* Aliging to word boundary*/
	_etext = .;        /* define a global symbols at end of text memory (.data section starts here)*/
  } > FLASH
  
  .data :
  {
	_sdata = .;        /*Create a global symbol at data start*/  
	*(.data)
	. = ALIGN(4);       /* Aliging to word boundary*/
	_edata = .;        /* define a global symbol at data end */
  } > SRAM AT> FLASH   /* VMA - SRAM, LMA - FLASH*/
  
  .bss :
  {
	_sbss = .;  		/* define a global symbol at bss start */
	*(.bss)
	. = ALIGN(4);       /* Aliging to word boundary*/
	_ebss = .;  		/* define a global symbol at bss end */
  } > SRAM

}