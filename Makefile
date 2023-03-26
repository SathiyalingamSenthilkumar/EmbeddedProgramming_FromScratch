#------------------------------------------------------------------------------
#  @file           : Makefile
#  @author         : Sathiya Lingam Senthil Kumar <slsathiya20@gmail.com>
#
# Makefile to perform cross-compilation as per requested platform target
#
#      build - Builds and links all source files
#      all - same as build
#      compile-all - Compile all object files  
#      clean - removes all generated files
#------------------------------------------------------------------------------

SOURCES = main.c \
		  startup_STM32F407.c

TARGET = final

# Flags
DEBUG ?= none # support semihosting

# Architectures Specific Flags
LINKER_FILE = ls_STM32F407.ld
CPU = cortex-m4
ISA_ARCH = thumb
SPECS = rdimon.specs


# Compiler Flags and Defines
CC = arm-none-eabi-gcc 
LD = arm-none-eabi-ld
SIZETOOL = arm-none-eabi-size
DUMPTOOL = arm-none-eabi-objdump  

#  Target specific flags
TARGET_SPECIFIC_FLAGS = -mcpu=$(CPU) \
						-m$(ISA_ARCH) \
						-mfloat-abi=soft

#Compiler Flags
CFLAGS =  -O0 -Wall -Werror -std=gnu11 \
			$(TARGET_SPECIFIC_FLAGS)

#Linker Flags
LDFLAGS = $(TARGET_SPECIFIC_FLAGS)\
          -Wl,-Map=$(TARGET).map \
		  -T $(LINKER_FILE)

ifeq ($(DEBUG), semihosting)
	CFLAGS += -DDEBUG_SEMIHOSTING
	CFLAGS += -g
	LDFLAGS += --specs=$(SPECS) # For using semi-hosted version of syscalls
else
	SOURCES += syscalls.c
endif

# Creating object file variables
OBJS = $(SOURCES:.c=.o)

# Creating Preprocessed file variables
PRES = $(SOURCES:.c=.i)

# Creating assembly file variables
ASMS = $(SOURCES:.c=.asm)

#Generating the Preprocessed files
%.i : %.c
	$(CC) $(CFLAGS) -E -o $@ $^

#Generating the assembly files	
%.asm : %.c
	$(CC) $(CFLAGS) -S -o $@ $^

#Generating the object files	
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^
	
# Building and linking to obtain the final target
.PHONY: all
all:$(TARGET).out 

$(TARGET).out: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

# Cleaning all non-source files and executables
.PHONY: clean
clean:
	rm -f $(OBJS) $(PRES) $(ASMS) $(TARGET).out $(TARGET).map

.PHONY: load
load:
	openocd -f board/stm32f4discovery.cfg