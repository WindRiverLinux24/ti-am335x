TI-AM335X-IMAGE-INSTALL = " \
alsa-utils \
can-utils \
cryptodev-module \
i2c-tools \
linux-firmware \
omapdrm-pvr \
pm-utils \
uim \
"

IMAGE_INSTALL += "${@bb.utils.contains('MACHINE', 'ti-am335x', '${TI-AM335X-IMAGE-INSTALL}', '', d)}"
