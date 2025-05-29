#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/nothing/tetris',
    'device/nothing/tetris',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    ('vendor.mediatek.hardware.videotelephony@1.0',): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    ('system_ext/lib64/libsource.so', 'vendor/lib64/hw/vendor.mediatek.hardware.pq_aidl-impl.so'): blob_fixup()
        .add_needed('libui_shim.so'),
    ('system_ext/etc/init/init.vtservice.rc', 'vendor/etc/init/android.hardware.neuralnetworks-shim-service-mtk.rc'): blob_fixup()
        .regex_replace('start', 'enable'),
    'vendor/etc/init/android.hardware.graphics.allocator-V2-service-mediatek.rc': blob_fixup()
        .regex_replace('android.hardware.graphics.allocator-V2-service-mediatek', 'mt6878/android.hardware.graphics.allocator-V2-service-mediatek.mt6878'),
    'vendor/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc': blob_fixup()
        .regex_replace('android.hardware.graphics.allocator@4.0-service-mediatek', 'mt6878/android.hardware.graphics.allocator@4.0-service-mediatek.mt6878'),
}  # fmt: skip

module = ExtractUtilsModule(
    'tetris',
    'nothing',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
