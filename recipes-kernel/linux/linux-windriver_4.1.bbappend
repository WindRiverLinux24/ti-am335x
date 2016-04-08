# # Copyright (C) 2014 Wind River Systems, Inc.
#
include linux-windriver-ti-am335x.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append_ti-am335x += "file://am335x-pm-firmware.elf"
do_configure_prepend() {
    if ${@bb.utils.contains('MACHINE', 'ti-am335x', 'true', 'false', d)}; then
        if test -s ${WORKDIR}/am335x-pm-firmware.elf; then
            cp ${WORKDIR}/am335x-pm-firmware.elf ${S}/firmware
        fi
    fi
}
