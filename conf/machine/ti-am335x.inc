DEFAULTTUNE ?= "cortexa8thf-neon"
require conf/machine/include/tune-cortexa8.inc

MACHINE_FEATURES += "usbhost jffs2 ext2 screen alsa vfat"

KERNEL_IMAGETYPE = "zImage"

SERIAL_CONSOLE = "115200 ttyO0"

IMAGE_FSTYPES ?= "tar.bz2"

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-video-fbdev \
           xf86-input-keyboard"
