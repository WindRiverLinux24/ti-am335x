#
# Copyright (C) 2014 Wind River Systems, Inc.
#

include linux-windriver-ti-am335x.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append += "file://am335x-pm-firmware.bin"

do_configure_prepend() {
	cp ${WORKDIR}/am335x-pm-firmware.bin ${WORKDIR}/linux/firmware
}
