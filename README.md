# CandyStick Pico

Turn your Raspberry Pi Pico into a FIDO2 authenticator.

Work in progress...

## Build

This project uses the [pico-sdk](https://github.com/raspberrypi/pico-sdk) and [tiynusb](https://github.com/hathach/tinyusb) libraries
to turn the Pico into a usb device.

The FIDO2 transport and application layers are implemented in Zig.

### SDK dependencies

First, install CMAKE and the GCC cross compiler:

#### Debian/ Ubuntu

```
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib
```

### Zig

Then, install a current version of the Zig compiler.

#### Brew

```
brew install zig --HEAD
```

### Build project

Finally, run `zig build cmake` to build the whole project. You can find the `.uf2` file within `./build`.




