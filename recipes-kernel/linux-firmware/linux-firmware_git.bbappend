#
# Copyright (C) 2017 Wind River Systems, Inc.
#
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

FWPATH = "/lib/firmware"

SRC_URI_append += "\
	file://TIInit_7.6.15.bts \
	file://am335x-evm-scale-data.bin \
	file://am335x-pm-firmware.elf \
	file://PRU_Halt.out \
	file://PRU_RPMsg_Echo_Interrupt0.out \
	file://PRU_RPMsg_Echo_Interrupt1.out \
	file://am335x-pru0-prueth-fw.elf \
	file://am335x-pru1-prueth-fw.elf \
	"

do_install_append() {
	install -d ${D}${FWPATH}/ti-connectivity
	install -m 0644 ${WORKDIR}/TIInit_7.6.15.bts ${D}${FWPATH}/ti-connectivity
	install -d ${D}${FWPATH}/pru
	install -m 0644 ${WORKDIR}/PRU_Halt.out ${D}${FWPATH}/pru
	install -m 0644 ${WORKDIR}/PRU_RPMsg_Echo_Interrupt0.out ${D}${FWPATH}/pru
	install -m 0644 ${WORKDIR}/PRU_RPMsg_Echo_Interrupt1.out ${D}${FWPATH}/pru
	ln -sf pru/PRU_RPMsg_Echo_Interrupt0.out ${D}${FWPATH}/am335x-pru0-fw
	ln -sf pru/PRU_RPMsg_Echo_Interrupt1.out ${D}${FWPATH}/am335x-pru1-fw
	install -d ${D}${FWPATH}/ti-pruss
	install -m 0644 ${WORKDIR}/am335x-pru0-prueth-fw.elf ${D}${FWPATH}/ti-pruss
	install -m 0644 ${WORKDIR}/am335x-pru1-prueth-fw.elf ${D}${FWPATH}/ti-pruss
	cp ${WORKDIR}/am335x-evm-scale-data.bin ${D}${FWPATH}
	cp ${WORKDIR}/am335x-pm-firmware.elf ${D}${FWPATH}
}

INSANE_SKIP_${PN}_ti-am335x += "arch"
