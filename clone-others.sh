#!/bin/bash

echo "Cloning kernel and vendor trees... Please wait and do not exit."

cd ../../../
rm -rf vendor/nothing
rm -rf kernel/nothing
rm -rf device/nothing/tetris-kernel

git clone https://github.com/NothingOSS/android_kernel_6.1_nothing_mt6878 kernel/nothing/tetris

git clone https://gitea.com/SuperAviation001/android_vendor_nothing_tetris vendor/nothing/tetris

git clone https://github.com/SuperAviation001/android_device_nothing_tetris-kernel device/nothing/tetris-kernel

cd device/nothing/tetris

echo "Done!"
