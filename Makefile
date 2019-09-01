PHONY: all clean flash debug

TARGET := template_cmsis

#Toolchain
#-------------------------------------------------------------------------------
AS := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gcc
CC := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gcc
LD := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-g++
CP := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-objcopy
SZ := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-size
RM := rm
CXX := /home/egor/arm-tools/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-g++
#GDB = arm-none-eabi-gdb
#OCD = openocd
#-------------------------------------------------------------------------------

#GCC config
#-------------------------------------------------------------------------------
CFLAGS += -D_ROM=65536
CFLAGS += -D_RAM=20480
CFLAGS += -D_ROM_OFF=0x08000000
CFLAGS += -D_RAM_OFF=0x20000000
CFLAGS += -mcpu=cortex-m3
CFLAGS += -mthumb
CFLAGS += -DSTM32F1
CFLAGS += -msoft-float
#-------------------------------------------------------------------------------

#startup file
#-------------------------------------------------------------------------------
STARTUP := startup_stm32f103xb.s
#-------------------------------------------------------------------------------
 
#Source path
#-------------------------------------------------------------------------------
SOURCEDIRS := src
#-------------------------------------------------------------------------------
 
#Header path
#-------------------------------------------------------------------------------
INCLUDES += inc
INCLUDES += include
#-------------------------------------------------------------------------------

#Linker script
#-------------------------------------------------------------------------------
LDSCRIPT := STM32F103XB_FLASH.ld
#-------------------------------------------------------------------------------
 
#Linker config
#-------------------------------------------------------------------------------
#LDFLAGS += -nostartfiles  -nostdlib -gc-sections -mthumb $(MCU)
LDFLAGS += -T $(LDSCRIPT)
#-------------------------------------------------------------------------------