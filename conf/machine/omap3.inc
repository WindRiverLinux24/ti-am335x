#@TYPE: Machine inc.
#@NAME: ti-omap3 layer

require conf/machine/include/tune-cortexa8.inc

MACHINE_FEATURES += " usbgadget usbhost jffs2 ext2 screen alsa vfat"

KERNEL_IMAGETYPE = "zImage"

SERIAL_CONSOLE = "115200 ttyO0"

IMAGE_FSTYPES ?= "tar.bz2"
