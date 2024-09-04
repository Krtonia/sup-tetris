#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nothing/tetris

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a55

IGNORE_PREFER32_ON_DEVICE := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := k6878v1_64

# Display
TARGET_SCREEN_DENSITY := 420

# Platform
BOARD_HAS_MTK_HARDWARE := true
TARGET_BOARD_PLATFORM := mt6878

# Inherit the proprietary files
include vendor/nothing/tetris/BoardConfigVendor.mk
