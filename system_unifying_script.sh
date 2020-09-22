!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

if [ "$RMX_PEAFOWL" = "RMX1971" ] || [ "$RMX_PEAFOWL" = "RMX1851" ] ; then
     rm -rf /system/etc/permissions/*inscreen*
fi    
