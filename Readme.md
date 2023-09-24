# A set of notes on programming an Upduino in 2023

These notes are for Linux users (or windows with WSL2).

## 1 - Install

First, install apio using pip, then install the toolchain

```
pip install apio
apio install oss-cad-suite
```

## 2 - Connect

To program the upduino, you need to use the FTDI drivers, so enable them

```
apio drivers --ftdi-enable
```

Then reconnect the board as it says.

### Connect on Windows 11 with WSL2 setup

If you're using Windows 11, you can passthrough usb devices to WSL2. Just use USBIPD. Open powershell as Administrator. List available USB devices and find the Upduino31

```
PS C:\Windows\system32> usbipd wsl list
BUSID  VID:PID    DEVICE                                                        STATE
... LINES SKIPPED....
16-1   0403:6014  USB Serial Converter                                          Not Attached
```

Tell USBIPD to attach it to WSL2

```
usbipd wsl attach --busid 16-1
```

You'll still need to enable FTDI drivers in WSL, and repeat the USBIPD connection steps again.

## 3 - Build

Lets use the Blinky test script as an example to upload. First lets build the code:

```
cd 00-blinky
apio build -b upduino31 
```

## 4 - Upload

Sending the bitstream is equally easy!

```
apio upload -b upduino31
```
