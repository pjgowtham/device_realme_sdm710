#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Fix camera blobs for Realme 5 pro
if [ "$RMX_PEAFOWL" = "RMX1971" ] ; then
    echo "Attempting to fix camera libs"
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.qtech_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.sunny_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.sunny_s5kgw1_evt0_2.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.qtech_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.sunny_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.holitech_gc2375h.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.sunny_hi846.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.truly_imx471.bin
    rm -rf /vendor/lib64/camera/libarcsoft_low_light_hdr.so
    mv /vendor/lib64/camera/5p_com.qti.tuned.holitech_gc2375h.bin /vendor/lib64/camera/com.qti.tuned.holitech_gc2375h.bin
    mv /vendor/lib64/camera/5p_com.qti.tuned.sunny_hi846.bin /vendor/lib64/camera/com.qti.tuned.sunny_hi846.bin
    mv /vendor/lib64/camera/5p_com.qti.tuned.truly_imx471.bin /vendor/lib64/camera/com.qti.tuned.truly_imx471.bin
    mv /vendor/lib64/camera/5p_libarcsoft_low_light_hdr.so /vendor/lib64/camera/libarcsoft_low_light_hdr.so
    echo "Done fixing camera libs"
fi
