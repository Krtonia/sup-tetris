#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Infinity-X stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit from tetris device
$(call inherit-product, device/nothing/tetris/device.mk)

# Infinity Flags
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_INCLUDE_ACCORD := false
EXTRA_UDFPS_ICONS := true
TARGET_HAS_UDFPS := trueAdd commentMore actions
INFINITY_BUILD_TYPE := UNOFFICIAL
INFINITY_MAINTAINER := Shikhar
TARGET_SUPPORTS_BLUR := false

# Gapps
WITH_GAPPS := true

# Device Specific flags
PRODUCT_NAME := infinity_tetris
PRODUCT_DEVICE := tetris
PRODUCT_BRAND := Nothing
PRODUCT_MANUFACTURER := Nothing
PRODUCT_MODEL := A015

PRODUCT_GMS_CLIENTID_BASE := android-nothing

DEVICE_CODENAME := tetris

TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="Tetris 15 AP3A.240905.015 2502082015 release-keys" \
    BuildFingerprint=Nothing/Tetris/Tetris:15/AP3A.240905.015.A2/2502082015:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)
