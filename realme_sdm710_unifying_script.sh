#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Remove camera motor hal in devices other than realme X
if [ "$RMX_PEAFOWL" = "RMX1901" ]; then
    echo "Preserving camera motor hal"
else
   echo "Attempting to remove camera motor hal"
    rm -rf /vendor/bin/hw/*motor*
    rm -rf /vendor/etc/init/hw/*motor*
    rm -rf /vendor/etc/init/*motor*    
    rm -rf /vendor/lib/*motor*
    rm -rf /vendor/lib64/*motor*
    rm -rf /vendor/etc/vintf/manifest/*motor*
    echo "Done removing camera motor hal"
fi

# Remove FOD hal in devices other than realme X and XT
if [ "$RMX_PEAFOWL" = "RMX1901" ] || [ "$RMX_PEAFOWL" = "RMX1921" ] ; then
    echo "Preserving FOD hal"
else
   echo "Attempting to remove FOD hal"
    rm -rf /vendor/bin/hw/*inscreen*
    rm -rf /vendor/etc/init/*inscreen*
    rm -rf /vendor/lib/*inscreen*
    rm -rf /vendor/lib64/*inscreen*
    rm -rf /vendor/etc/vintf/manifest/*inscreen*
    echo "Done removing FOD hal"
fi
