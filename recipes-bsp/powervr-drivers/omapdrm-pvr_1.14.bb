DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
LICENSE = "MIT | GPLv2"
LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"

inherit module

COMPATIBLE_MACHINE = "ti-am335x"

MACHINE_KERNEL_PR_append = "m"
PR = "${MACHINE_KERNEL_PR}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

BRANCH = "ti-img-sgx/1.14.3699939/k4.14"

SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"

SRCREV = "d2b3959738cfcc6209e8e882d1989de790866c8f"

TARGET_PRODUCT_ti-am335x = "ti335x"

EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" EXTRA_KBUILD_SOURCE=${STAGING_KERNEL_BUILDDIR} TARGET_PRODUCT=${TARGET_PRODUCT}'

do_compile_prepend() {
    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
}

do_install() {
    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
}
