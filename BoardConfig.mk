#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/realme_sdm710
BOARD_VENDOR := realme
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

TARGET_USES_64_BIT_BINDER := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := sdm710
TARGET_BOARD_PLATFORM := sdm710
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 swiotlb=1 loop.max_part=7
BOARD_KERNEL_CMDLINE += printk.devkmsg=on
BOARD_KERNEL_CMDLINE += kpti=off
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --header_version 1
#TARGET_KERNEL_CLANG_COMPILE := true
#TARGET_KERNEL_SOURCE := kernel/realme/sdm710
#TARGET_KERNEL_CONFIG := RMX1921_defconfig

# Assertion
TARGET_OTA_ASSERT_DEVICE := RMX1921,RMX1921EU,RMX1901,RMX1901CN,RMX1851,RMX1971,RMX1971CN

# Audio
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_CUSTOM_AUDIO_POLICY := 1
TARGET_PROVIDES_AUDIO_EXTNS := true
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
TARGET_USE_QTI_BT_STACK := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Display
TARGET_SCREEN_DENSITY := 440

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# FOD
TARGET_SURFACEFLINGER_FOD_LIB := //$(DEVICE_PATH):libfod_extension.realme_sdm710

# Graphics
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_realme_sdm710
TARGET_RECOVERY_DEVICE_MODULES := libinit_realme_sdm710

# LMKD
TARGET_LMKD_STATS_LOG := true

# NFC
TARGET_USES_NQ_NFC := true
BOARD_NFC_CHIPSET := pn544

# ODM
ODM_MANIFEST_SKUS += \
    RMX1921 \
    RMX1921EU \
    RMX1901 \
    RMX1901CN

ODM_MANIFEST_RMX1921_FILES := $(DEVICE_PATH)/odm_manifests/manifest_RMX1921.xml
ODM_MANIFEST_RMX1921EU_FILES := $(DEVICE_PATH)/odm_manifests/manifest_RMX1921EU.xml
ODM_MANIFEST_RMX1901_FILES := $(DEVICE_PATH)/odm_manifests/manifest_RMX1901.xml
ODM_MANIFEST_RMX1901CN_FILES := $(DEVICE_PATH)/odm_manifests/manifest_RMX1901.xml

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

TARGET_KERNEL_APPEND_DTB := false
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456

BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_PARTITION_SIZE := 268435456

BOARD_USERDATAIMAGE_PARTITION_SIZE := 55141412864
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
-include $(LOCAL_PATH)/vendor_prop.mk

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Root
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

# Security patch level
VENDOR_SECURITY_PATCH := 2021-06-05

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SELINUX_IGNORE_NEVERALLOWS := true

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current

# Kernel modules
KERNEL_MODULES_DIR := $(DEVICE_PATH)/kernel_modules
BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_MODULES_DIR)/audio_adsp_loader.ko \
    $(KERNEL_MODULES_DIR)/audio_pinctrl_wcd.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd9xxx.ko \
    $(KERNEL_MODULES_DIR)/audio_ak4376.ko \
    $(KERNEL_MODULES_DIR)/audio_platform.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd_core.ko \
    $(KERNEL_MODULES_DIR)/audio_analog_cdc.ko \
    $(KERNEL_MODULES_DIR)/audio_q6.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd_cpe.ko \
    $(KERNEL_MODULES_DIR)/audio_apr.ko \
    $(KERNEL_MODULES_DIR)/audio_q6_notifier.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd_spi.ko \
    $(KERNEL_MODULES_DIR)/audio_cpe_lsm.ko \
    $(KERNEL_MODULES_DIR)/audio_q6_pdr.ko \
    $(KERNEL_MODULES_DIR)/audio_wglink.ko \
    $(KERNEL_MODULES_DIR)/audio_digital_cdc.ko \
    $(KERNEL_MODULES_DIR)/audio_stub.ko \
    $(KERNEL_MODULES_DIR)/audio_wsa881x.ko \
    $(KERNEL_MODULES_DIR)/audio_dspg_dbmdx.ko \
    $(KERNEL_MODULES_DIR)/audio_swr_ctrl.ko \
    $(KERNEL_MODULES_DIR)/llcc_perfmon.ko \
    $(KERNEL_MODULES_DIR)/audio_hdmi.ko \
    $(KERNEL_MODULES_DIR)/audio_swr.ko \
    $(KERNEL_MODULES_DIR)/mpq-adapter.ko \
    $(KERNEL_MODULES_DIR)/audio_machine_sdm710.ko \
    $(KERNEL_MODULES_DIR)/audio_tfa98xx.ko \
    $(KERNEL_MODULES_DIR)/mpq-dmx-hw-plugin.ko \
    $(KERNEL_MODULES_DIR)/audio_mbhc.ko \
    $(KERNEL_MODULES_DIR)/audio_tfa98xx-v6.ko \
    $(KERNEL_MODULES_DIR)/qca_cld3_wlan.ko \
    $(KERNEL_MODULES_DIR)/audio_msm_sdw.ko \
    $(KERNEL_MODULES_DIR)/audio_usf.ko \
    $(KERNEL_MODULES_DIR)/rdbg.ko \
    $(KERNEL_MODULES_DIR)/audio_native.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd9335.ko \
    $(KERNEL_MODULES_DIR)/audio_pinctrl_lpi.ko \
    $(KERNEL_MODULES_DIR)/audio_wcd934x.ko
