TI-AM335X-IMAGE-INSTALL = " \
alsa-utils \
lm-sensors \
i2c-tools \
pm-utils \
canutils \
ptpd \
hostapd  \
hostap-utils  \
wireless-tools \
wpa-supplicant \
linux-firmware \
omapdrm-pvr \
uim \
"

IMAGE_INSTALL += "${@bb.utils.contains('MACHINE', 'ti-am335x', '${TI-AM335X-IMAGE-INSTALL}', '', d)}"

