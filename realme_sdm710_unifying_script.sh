#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")
RMX_PEAFOWL_EU=$(getprop "ro.boot.product.hardware.sku")

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

# Remove NFC stuffs on devices other than EU/RU versions of Realme XT
if [ "$RMX_PEAFOWL_EU" = "nfc_ese" ] || [ "$RMX_PEAFOWL_EU" = "RMX1921EU" ] ; then
    echo "Preserving NFC feature"
else
   echo "Attempting to remove NFC feature"
    # Remove NFC
    rm -rf /system/app/*Nfc*
    rm -rf /system/etc/permissions/*nfc*
    rm -rf /system/framework/*nfc*
    rm -rf /system/lib/*nfc*
    rm -rf /system/lib64/*nfc*
    rm -rf /system/priv-app/Tag
    rm -rf /vendor/app/SmartcardService
    rm -rf /vendor/bin/*nfc*
    rm -rf /vendor/bin/hw/*nfc*
    rm -rf /vendor/etc/*nfc*
    rm -rf /vendor/etc/init/*nfc*
    rm -rf /vendor/etc/permissions/*nfc*
    rm -rf /vendor/firmware/libpn553_fw.so
    rm -rf /vendor/lib/*nfc*
    rm -rf /vendor/lib/hw/*nfc*
    rm -rf /vendor/lib64/*nfc*
    rm -rf /vendor/lib64/hw/*nfc*
    echo "Done removing NFC feature"
fi

# Remove GW1 camera blobs for Realme 5 Pro
if [ "$RMX_PEAFOWL" = "RMX1971" ] ; then
    echo "Attempting to fix camera libs"
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.qtech_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.sunny_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.sensormodule.sunny_s5kgw1_evt0_2.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.qtech_s5kgw1.bin
    rm -rf /vendor/lib64/camera/com.qti.tuned.sunny_s5kgw1.bin
    echo "Done fixing camera libs"
fi
