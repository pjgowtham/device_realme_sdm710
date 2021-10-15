#!/system/bin/sh
#
# Copyright (C) 2020-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Fix device specific configs
    cp -r /odm/$RMX_PEAFOWL/* /odm
    rm -r /odm/RMX*
    
# Dalvik heap
if grep MemTotal /proc/meminfo | awk '{print $2 / 1024}' < 4000; then
   # Dalvik heap configs for 4GB variants
   sed -i 's/heapstartsize=16m/heapstartsize=8m/g' /vendor/build.prop
   sed -i 's/heapgrowthlimit=256m/heapgrowthlimit=192m/g' /vendor/build.prop
   sed -i 's/heaptargetutilization=0.5/heaptargetutilization=0.6/g' /vendor/build.prop
   sed -i 's/heapmaxfree=32m/heapmaxfree=16m/g' /vendor/build.prop
fi
