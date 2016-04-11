#
# Copyright (C) 2016 Wind River Systems, Inc.
#

TARGET_SUPPORTED_KTYPES_ti-am335x = "standard preempt-rt"
KERNEL_DEVICETREE_ti-am335x = "am335x-evm.dtb \
			       am335x-evmsk.dtb \
		     	       am335x-boneblack.dtb"
KERNEL_EXTRA_ARGS += "LOADADDR=0x80008000"
# Requires libgcc.a
DEPENDS_append_ti-am335x = " libgcc"
KERNEL_CC_append_ti-am335x = " ${TOOLCHAIN_OPTIONS}"
KERNEL_LD_append_ti-am335x = " ${TOOLCHAIN_OPTIONS}"
