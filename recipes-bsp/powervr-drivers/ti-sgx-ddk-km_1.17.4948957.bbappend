FILESEXTRAPATHS:prepend:ti-am335x := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE:ti-am335x = "ti-am335x"
TARGET_PRODUCT:ti-am335x = "ti335x_linux"

SRC_URI:append:ti-am335x = " \
	file://0001-eurasiacon-kbuild-Makefile.template-replace-.SECONDA.patch \
	file://0002-services4-srvkm-osfunc-drop-unused-parameter-for-get.patch \
	file://0003-services4-srvkm-mmap-use-vma-vm_flags-wrapper-functi.patch \
"

do_install:ti-am335x() {
    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armel/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
}

