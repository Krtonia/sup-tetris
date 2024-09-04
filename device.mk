#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 34
BOARD_SHIPPING_API_LEVEL := 34

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Kernel
$(call inherit-product, device/nothing/tetris-kernel/kernel.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/nothing/tetris/tetris-vendor.mk)
