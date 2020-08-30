#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Launched with pie
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/realme/realme_sdm710/realme_sdm710-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml
        
# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

PRODUCT_PACKAGES += \
    RealmeCameraHelper \
    lineage.camera.motor@1.0-service.RMX1901

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29
    
# Display
PRODUCT_PACKAGES += \
    libvulkan

# Doze
PRODUCT_PACKAGES += \
    RealmeParts \
    devicesettings

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.oppo.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1-service.realme_sdm710 \
    lineage.biometrics.fingerprint.inscreen@1.0-service.realme_sdm710

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.realme_sdm710

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# ODM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/odm_manifests/manifest_RMX1901.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/odm/etc/manifest_RMX1901.xml \
    $(LOCAL_PATH)/odm_manifests/manifest_RMX1901.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/odm/etc/manifest_RMX1901CN.xml \
    $(LOCAL_PATH)/odm_manifests/manifest_RMX1921.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/odm/etc/manifest_RMX1921.xml \
    $(LOCAL_PATH)/odm_manifests/manifest_RMX1921EU.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/odm/etc/manifest_RMX1921EU.xml
    
# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service-qti

# Ramdisk
PRODUCT_PACKAGES += \
    init.devicesetting.rc \
    init.qcom.rc

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_realme_sdm710

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.realme_sdm710

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.realme_sdm710
    
# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# WiFi Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libnl \
    libqdMetaData \
    libqdMetaData.system \

PRODUCT_BOOT_JARS += \
    WfdCommon
