#!/bin/bash

rm -rf hardware/mediatek

if [ ! -d "hardware/mediatek" ]; then
  git clone https://github.com/SuperAviation001/android_hardware_mediatek -b lineage-22.2 hardware/mediatek
fi
if [ ! -d "vendor/nothing/tetris" ]; then
  git clone https://gitlab.com/krtonia/android_vendor_nothing_tetris.git -b a15 vendor/nothing/tetris
fi
if [ ! -d "kernel/nothing/tetris" ]; then
  git clone https://github.com/SuperAviation001/android_kernel_nothing_tetris -b lineage-22.2 kernel/nothing/tetris
fi
if [ ! -d "device/nothing/tetris-kernel" ]; then
  git clone https://github.com/SuperAviation001/android_device_nothing_tetris-kernel -b lineage-22.2 device/nothing/tetris-kernel
fi
