#!/bin/bash

VERSION=5.11.1
SONOFF_BIN_DIR=~/ESP8266/sonoff_tasmota_${VERSION}.bin
USB_PORT=/dev/tty.SLAB_USBtoUART
BAUD=115200
SIZE=1MB
MODE=dout

python3 ~/ESP8266/esptool/esptool.py \
	--port $USB_PORT   \
	--baud $BAUD       \
	write_flash        \
	--flash_size $SIZE \
	--flash_freq 80m   \
	--flash_mode $MODE \
	0x00000 $SONOFF_BIN_DIR
