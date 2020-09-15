#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Choose appropriate camera blobs for the device
if [ "$RMX_PEAFOWL" = "RMX1921" ]; then
    echo "Device detected as Realme XT"
    rm -rf /vendor/lib/camera_3P
    rm -rf /vendor/lib/camera_5P
    rm -rf /vendor/lib/camera_X
    rm -rf /vendor/lib64/camera_3P
    rm -rf /vendor/lib64/camera_5P
    rm -rf /vendor/lib64/camera_X
    mv /vendor/lib/camera_XT /vendor/lib/camera  
    mv /vendor/lib64/camera_XT /vendor/lib64/camera
elif [ "$RMX_PEAFOWL" = "RMX1901" ]; then
    echo "Device detected as Realme X"
    rm -rf /vendor/lib/camera_3P
    rm -rf /vendor/lib/camera_5P
    rm -rf /vendor/lib/camera_XT
    rm -rf /vendor/lib64/camera_3P
    rm -rf /vendor/lib64/camera_5P
    rm -rf /vendor/lib64/camera_XT
    mv /vendor/lib/camera_X /vendor/lib/camera  
    mv /vendor/lib64/camera_X /vendor/lib64/camera
elif [ "$RMX_PEAFOWL" = "RMX1851" ]; then
    echo "Device detected as Realme 3 Pro"
    rm -rf /vendor/lib/camera_XT
    rm -rf /vendor/lib/camera_5P
    rm -rf /vendor/lib/camera_X
    rm -rf /vendor/lib64/camera_XT
    rm -rf /vendor/lib64/camera_5P
    rm -rf /vendor/lib64/camera_X
    mv /vendor/lib/camera_3P /vendor/lib/camera  
    mv /vendor/lib64/camera_3P /vendor/lib64/camera
elif [ "$RMX_PEAFOWL" = "RMX1971" ]; then
    echo "Device detected as Realme XT"
    rm -rf /vendor/lib/camera_3P
    rm -rf /vendor/lib/camera_XT
    rm -rf /vendor/lib/camera_X
    rm -rf /vendor/lib64/camera_3P
    rm -rf /vendor/lib64/camera_XT
    rm -rf /vendor/lib64/camera_X
    mv /vendor/lib/camera_5P /vendor/lib/camera  
    mv /vendor/lib64/camera_5P /vendor/lib64/camera
fi
