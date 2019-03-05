#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## List of Firmware bin files to be copied

LOCAL_FIRMWARE_SRC := \
    i6050-fw-usb-1.5.sbcf \
    i2400m-fw-usb-1.4.sbcf \
    i2400m-fw-usb-1.5.sbcf \
    iwlwifi-3168-29.ucode \
    iwlwifi-8265-31.ucode \
    iwlwifi-9000-pu-b0-jf-b0-38.ucode \
    iwlwifi-9000-pu-b0-jf-b0-41.ucode \
    iwlwifi-9260-th-b0-jf-b0-38.ucode \
    iwlwifi-9260-th-b0-jf-b0-41.ucode \
    iwlwifi-9260-th-b0-jf-b0-43.ucode

## List of complete Firmware folders to be copied

LOCAL_FIRMWARE_DIR := \
    intel \
    i915

## List of matching patterns of Firmware bins to be copied

#LOCAL_FIRMWARE_PATTERN := \
#    iwlwifi

LOCAL_FIRMWARE_SRC += $(foreach f,$(LOCAL_FIRMWARE_PATTERN),$(shell cd $(FIRMWARES_DIR) && find . -iname "*$(f)*" -type f ))
LOCAL_FIRMWARE_SRC += $(foreach f,$(LOCAL_FIRMWARE_DIR),$(shell cd $(FIRMWARES_DIR) && find $(f) -type f) )

PRODUCT_COPY_FILES := \
    $(foreach f,$(LOCAL_FIRMWARE_SRC),$(FIRMWARES_DIR)/$(f):$(TARGET_COPY_OUT_VENDOR)/firmware/$(f))
