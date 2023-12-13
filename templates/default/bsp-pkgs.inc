IMAGE_INSTALL += "linux-firmware-wl18xx"
IMAGE_INSTALL += "linux-firmware-wl12xx"
IMAGE_INSTALL += "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "ti-sgx-ddk-km ti-sgx-ddk-um mesa-pvr", " ", d)}"
IMAGE_INSTALL += 'u-boot-ti-staging'
