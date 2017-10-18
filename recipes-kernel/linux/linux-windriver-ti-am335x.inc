#
# Copyright (C) 2017 Wind River Systems, Inc.
#

TARGET_SUPPORTED_KTYPES_ti-am335x = "standard preempt-rt"
KERNEL_DEVICETREE_ti-am335x = "am335x-evmsk.dtb \
				"

KBRANCH_DEFAULT_standard_ti-am335x  = "standard/${KMACHINE}"
KBRANCH_DEFAULT_preempt-rt_ti-am335x  = "standard/preempt-rt/${KMACHINE}"
