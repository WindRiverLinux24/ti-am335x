#
# Copyright (C) 2014 Wind River Systems, Inc.
#
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

FWPATH = "/lib/firmware"

SRC_URI += "\
	file://TIInit_7.6.15.bts \
	file://am335x-evm-scale-data.bin \
	"

do_install_append() {
	install -d ${D}${FWPATH}
	install -d ${D}${FWPATH}ti-connectivity
	install -m 0644 ${WORKDIR}/TIInit_7.6.15.bts ${D}${FWPATH}
	install -m 0644 LICENCE.ti-connectivity ${D}${FWPATH}
	install -m 0644 ti-connectivity/wl1271-nvs.bin ${D}${FWPATH}ti-connectivity
	cp ti-connectivity/wl127x-fw-5* ${D}${FWPATH}ti-connectivity
	cp ${WORKDIR}/TIInit_7.6.15.bts ${D}${FWPATH}
	cp ${WORKDIR}/am335x-evm-scale-data.bin ${D}${FWPATH}
}

PACKAGES =+ " ${PN}-wl127x-fw-5"

FILES_${PN}-wl127x-fw-5 = " \
  ${FWPATH}LICENCE \
  ${FWPATH}TIInit_7.6.15.bts \
  ${FWPATH}ti-connectivity/wl1271-nvs.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-5-mr.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-5-plt.bin \
  ${FWPATH}ti-connectivity/wl127x-fw-5-sr.bin \
  ${FWPATH}LICENCE.ti-connectivity \
"
