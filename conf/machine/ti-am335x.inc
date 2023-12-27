DEFAULTTUNE ?= "cortexa8thf-neon"
require conf/machine/include/arm/armv7a/tune-cortexa8.inc

KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
KERNEL_DTBVENDORED = "1"

MACHINE_FEATURES += "usbhost jffs2 ext2 screen alsa"

DISTRO_FEATURES:append = " vfat wifi bluetooth"

KERNEL_IMAGETYPE = "zImage"
KERNEL_DEVICETREE = "am335x-evm.dtb am335x-boneblack.dtb"

SERIAL_CONSOLE = "115200 ttyS0"

PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"

IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"

IMAGE_FSTYPES += "tar.bz2 wic wic.bmap"
WKS_FILE ?= "am335x-sdimage.wks"
do_image_wic[depends] += " mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
IMAGE_BOOT_FILES ?= " zImage am335x-evm.dtb am335x-boneblack.dtb u-boot.img MLO u-boot-spl.bin"

UBOOT_MACHINE = "am335x_evm_config"
UBOOT_ARCH = "arm"
UBOOT_SUFFIX = "img"
SPL_BINARY = "MLO"

PREFERRED_PROVIDER_virtual/egl = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles3 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles2 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles1 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgbm = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgl = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libglx = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/mesa = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
PREFERRED_PROVIDER_virtual/gpudriver ?= "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "ti-sgx-ddk-km", "", d)}"
