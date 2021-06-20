#!/sbin/sh
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get device codename
RMX_PEAFOWL=$(getprop "ro.product.model")

# Fix device specific configs
    mv /odm/$RMX_PEAFOWL/* /odm
    rm /odm/RMX*
