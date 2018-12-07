DEFAULTTUNE ?= "cortexa8thf-neon"
require conf/machine/include/tune-cortexa8.inc

MACHINE_FEATURES += "usbhost jffs2 ext2 screen alsa"

DISTRO_FEATURES_append = " vfat wifi bluetooth"

KERNEL_IMAGETYPE = "zImage"
KERNEL_DEVICETREE_ti-am335x = "am335x-evm.dtb am335x-evmsk.dtb am335x-boneblack.dtb"

SERIAL_CONSOLE = "115200 ttyS0"

IMAGE_FSTYPES += "tar.bz2 wic wic.bmap"
WKS_FILE ?= "am335x-sdimage.wks"
do_image_wic[depends] += " mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
IMAGE_BOOT_FILES ?= " zImage am335x-evm.dtb am335x-evmsk.dtb am335x-boneblack.dtb "

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-video-fbdev \
           xf86-input-keyboard"

PREFERRED_PROVIDER_libgbm = "libgbm"
PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
PREFERRED_PROVIDER_virtual/egl_ti-am335x = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1_ti-am335x = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2_ti-am335x = "ti-sgx-ddk-um"

PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
PREFERRED_VERSION_linux-yocto ?= "4.18%"
