### Software
The purpose of this document is to give easy reference to the various types of
both private and open source software used throughout this project. High level
reviews of the software's purpose and links to further reading or documentation
can be found here.

### ESPTool
**TL;DR** The esptool is a python utility for flashing firmware onto an ESP chip

#### Links
- [Espressif esptool](https://github.com/espressif/esptool)

### [Node-Red](https://github.com/node-red/node-red-dashboard)
**TL;DR** Distributed system visualization

#### Links
- [Node-Red](https://github.com/node-red/node-red-dashboard)

### [Logstash]()

### [Elasticsearch]()

### [Sonoff-Tasmota](https://github.com/arendst/Sonoff-Tasmota)
**TL;DR** The firmware flashed onto many of the ESP8266 chips in this project.

#### General Notes
Version in Project: `v5.11.1` (`20180115`)
Binary Location: `~/ESP8266/sonoff.bin`

Sonoff-Tasmota, or just tasmota, is a small binary which we're using to interact
with many of the ESP8266 chips. It is convenient for the Sonoff devices, as the
name insinuates, as it is built to easily toggle the GPIO pin for the relay which
ships as part of the switch.

The software is written largely in `C++` but includes some nice to haves such as
a web interface and console which add a bit of weight given the `HTML` and `CSS`
necessitated by these interfaces. None the less, it is a wonderfully designed
piece of software being actively worked upon by a dedicated maintainer.

As of writing this (`Mon Jan 15 12:09:26 EST 2018`) the project's hardware 
resources do not include a USB / UART serial converter (should be coming today)
but the want to play with this software has been far too tempting to ignore. Thus
I have flashed it onto an `ESP8266 AI-Thinker` (chip that ships with most of the
NodeMCU breakout boards) and have found the software to be quite compatible. The
pin headers are even the same! None the less, this gives way to the possibility
that Tasmota may be used more through out the project and not solely for the
Sonoff devices.

To flash the `AI-Thinker` chip with Tasmota, the `esptool` (see more in esptool
section) was used. For the sake of posterity, I am including the baud rate and
other flags used in order to successfully get this software onto the chip.

```
python3 esptool/esptool.py --port /dev/tty.SLAB_USBtoUART \
                           --baud 115200 write_flash      \
                           --flash_size 4MB               \
                           --flash_freq 80m               \
                           --flash_mode dout              \
                           0x00000 sonoff.bin
```

Do also note that, some minutes were spent in frustration that the chip was not
registering at `/dev/tty.SLAB_USBtoUART`. After reinstalling the VCP drivers
from [Silicon Labs](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)
it became apparent this was not an issue on the machine's side. Turns out it was
an issue with the cable. **If this doesn't work, try another cable first!**

#### Links
- [Sonoff-Tasmota Commands](https://github.com/arendst/Sonoff-Tasmota/wiki/Commands)

### Virtual COM Port (VCP) Driver
**TL;DR** The software used to virtualize `COM` port and serialize `USB` to `UART`

#### Links
- [Sci Labs, CP210x USB to UART Bridge VCP Drivers](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)
- [Sci Labs, USB Bridges](https://www.silabs.com/products/interface/usb-bridges)
