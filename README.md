# Huion Kamvas 13 Pro configuration files for GNOME Draw On Your Screen

Configuration files to make a Huion Kamvas 13 Pro work with GNOME extension
Draw On Your Screen, in Ubuntu 20.04.

https://user-images.githubusercontent.com/1628587/231996520-e73415b9-23aa-469c-b843-def1641ac57e.mp4

## Install the GNOME Extension

Go to the extension page and enable it:

https://extensions.gnome.org/extension/1683/draw-on-you-screen/


## Install the driver

The driver is available here:

https://github.com/Mantaseus/Huion_Kamvas_Linux

### Configure the X Window Server

Install the following package:

```
sudo apt-get install xserver-xorg-input-evdev
```

Edit or create the file:

```
sudo nano /etc/X11/xorg.conf
```

And add:

```
Section "InputClass"
    Identifier "evdev tablet catchall"
    MatchIsTablet "on"
    MatchDevicePath "/dev/input/event*"
    Driver "evdev"
EndSection
```

### Install the driver package

```
sudo pip3 install kamvas-driver
```

### Copy the configuration file `.kamvas_config.yaml` to your home directory:

```
cp .kamvas_config.yaml ~/.kamvas_config.yaml
```

### Confirm the values in the configuration file for your tablet

- `vendor_id`: `0x256c`
- `product_id`: `0x006d`

Check with `sudo lsusb`.

- `default_display`: `DP-1-1`

I got a HDMI to Display Port converter, but if using HDMI probably its
`HDMI1`.

Check with `sudo xrandr`.


## Start the driver

```
sudo rmmod hid-uclogic
kamvas start
```
