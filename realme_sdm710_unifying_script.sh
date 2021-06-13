#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Fix camera blobs for Realme 5 pro
if [ "$RMX_PEAFOWL" = "RMX1901" ] ; then

    mv /odm/RMX1901/* /odm
    rm /odm/RMX*
else
if [ "$RMX_PEAFOWL" = "RMX1921" ] ; then    
    mv /odm/RMX1921/* /odm
    rm /odm/RMX*
else
if [ "$RMX_PEAFOWL" = "RMX1971" ] ; then
    mv /odm/RMX1971/* /odm
    rm /odm/RMX*
else    
if [ "$RMX_PEAFOWL" = "RMX1851" ] ; then
    mv /odm/RMX1851/* /odm
    rm /odm/RMX*
fi
