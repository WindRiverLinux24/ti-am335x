COMPATIBLE_MACHINE:ti-am335x = "ti-am335x"
TARGET_PRODUCT:ti-am335x = "ti335x_linux"

do_install:ti-am335x() {
    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armel/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
}

