DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"

PV = "1.0"
PR_append = "+gitr${SRCPV}"

SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
SRC_URI = "git://gitorious.org/uim/uim.git;protocol=https \
	   file://0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch \
	   file://uim-sysfs \
	"

S = "${WORKDIR}/git"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 uim ${D}${bindir}
	install -m 0755 ${WORKDIR}/uim-sysfs ${D}${bindir}
}
