DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
LICENSE = "MIT | GPLv2"
LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=17;endline=26;md5=74506d9b8e5edbce66c2747c50fcef12"

inherit module

COMPATIBLE_MACHINE = "ti-am335x"

MACHINE_KERNEL_PR_append = "i"
PR = "${MACHINE_KERNEL_PR}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

BRANCH = "am4/k4.1"

SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
S = "${WORKDIR}/git"

SRCREV = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"

TARGET_PRODUCT_ti-am335x = "ti335x"

EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} PVR_NULLDRM=1'

do_compile_prepend() {
    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap335x_linux
}

do_install() {
    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap335x_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
}

