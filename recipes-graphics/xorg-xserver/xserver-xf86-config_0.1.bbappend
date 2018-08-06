#
# Copyright (C) 2014 Wind River Systems, Inc.
#
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_ti-am335x += "file://xorg-${MACHINE}.conf"
SRC_URI_append_ti-am335x += "file://xorg-${MACHINE}-sk.conf"

do_install_prepend_ti-am335x () {
        mv ${WORKDIR}/xorg-${MACHINE}.conf ${WORKDIR}/xorg.conf
}

do_install_append_ti-am335x () {
        cp ${WORKDIR}/xorg-${MACHINE}-sk.conf  ${D}${sysconfdir}/X11/xorg-sk.conf
}
