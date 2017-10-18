#
# Copyright (C) 2014 Wind River Systems, Inc.
#
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_ti-am335x += "file://xorg-${MACHINE}.conf"

do_install_prepend () {
        mv ${WORKDIR}/xorg-${MACHINE}.conf ${WORKDIR}/xorg.conf
}
