#------------------------------------------------------------------------------
# Makefile to perform cross-compilation as per requested platform target
#
#      build - Builds and links all source files
#      all - same as build
#      compile-all - Compile all object files  
#      clean - removes all generated files
#
# Platform Overrides:
#      PLATFORM - Can choose between HOST and MSP432
#
#------------------------------------------------------------------------------

SOURCES = main.c

TARGET = final

# Architectures Specific Flags
LINKER_FILE = STM32f407.ld
CPU = cortex-m4
ARCH = thumb
SPECS = nosys.specs


# Compiler Flags and Defines
CC = arm-none-eabi-gcc 
LD = arm-none-eabi-ld
LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
CFLAGS = -g -O0 -Wall -Werror -std=gnu11 -mcpu=$(CPU) -m$(ARCH) 
	#-march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
	#--specs=$(SPECS) -Wall

SIZETOOL = arm-none-eabi-size     #To produce the size of code
DUMPTOOL = arm-none-eabi-objdump  


# Creating object file variables
OBJS = $(SOURCES:.c=.o)

# Creating Preprocessed file variables
PRES = $(SOURCES:.c=.i)

# Creating assembly file variables
ASMS = $(SOURCES:.c=.asm)

#Generating the Preprocessed files
%.i : %.c
	$(CC) $(CFLAGS) -E -o $@ $<

#Generating the assembly files	
%.asm : %.c
	$(CC) $(CFLAGS) -S -o $@ $<

#Generating the object files	
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Cleaning all non-source files and executables
.PHONY: clean
clean:
	rm -f $(OBJS) $(PRES) $(ASMS) 
#$(TARGET).out $(TARGET).map $(TARGET).asm
