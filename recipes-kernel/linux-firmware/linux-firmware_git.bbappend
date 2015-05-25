#
# Copyright (C) 2014 Wind River Systems, Inc.
#
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LICENSE = "Proprietary"

FWPATH = "/lib/firmware"

SRC_URI += "\
	file://TIInit_7.6.15.bts \
	"

do_install_append() {
	install -d ${D}${FWPATH}
	install -d ${D}${FWPATH}ti-connectivity
	install -m 0644 ${WORKDIR}/TIInit_7.6.15.bts ${D}${FWPATH}
	install -m 0644 LICENCE.ti-connectivity ${D}${FWPATH}
	install -m 0644 ti-connectivity/wl1271-nvs.bin ${D}${FWPATH}ti-connectivity
	cp ti-connectivity/wl127x-fw-4* ${D}${FWPATH}ti-connectivity
}

PACKAGES =+ " ${PN}-wl127x-fw-4"

FILES_${PN}-wl127x-fw-4 = " \
  ${FWPATH}LICENCE \
  ${FWPATH}TIInit_7.6.15.bts \
  ${FWPATH}ti-connectivity/wl1271-nvs.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-4-mr.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-4-plt.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-4-sr.bin \
  ${FWPATH}LICENCE.ti-connectivity \
"
