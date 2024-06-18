#
# Copyright 2020 The Android Open Source Project
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


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../base_aaos/fstab:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.base_aaos \
    $(LOCAL_PATH)/../base_aaos/fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.base_aaos \
    $(LOCAL_PATH)/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.aaos_iasw.rc


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/docker/lic_install.sh:/vendor/bin/lic_install.sh \
    $(LOCAL_PATH)/extra_files/docker/docker_manager:/vendor/bin/docker_manager \
    $(LOCAL_PATH)/extra_files/docker/containerd:/vendor/bin/containerd \
    $(LOCAL_PATH)/extra_files/docker/containerd-shim-runc-v2:/vendor/bin/containerd-shim-runc-v2 \
    $(LOCAL_PATH)/extra_files/docker/docker:/vendor/bin/docker \
    $(LOCAL_PATH)/extra_files/docker/dockerd:/vendor/bin/dockerd \
    $(LOCAL_PATH)/extra_files/docker/dockerd-dev:/vendor/bin/dockerd-dev \
    $(LOCAL_PATH)/extra_files/docker/runc:/vendor/bin/runc \
    $(LOCAL_PATH)/extra_files/docker/99-ignore-keyboard.rules:/vendor/etc/docker/config/99-ignore-keyboard.rules \
    $(LOCAL_PATH)/extra_files/docker/99-ignore-mouse.rules:/vendor/etc/docker/config/99-ignore-mouse.rules \
    $(LOCAL_PATH)/extra_files/docker/config.toml:/vendor/etc/docker/etc/containerd/config.toml \
    $(LOCAL_PATH)/extra_files/docker/daemon.json:/vendor/etc/docker/etc/docker/daemon.json \

PRODUCT_PACKAGES += sumClientInAndroid \
    multiplyServiceInAndroid \
    multiplyClientInAndroid \
    subtractServiceApplicationInAndroid \
    SharedBufferServiceInAndroid \
    SharedBufferClientInAndroid \
    Steam \
    Genshin \
    Epic \
    LIC \
    liblic-epic \
    liblic-genshin \
    liblic-steam \
    liblic-proxy \
    ContainerManager \
    libstreamingbindersdk \
    libaaudiosdk

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.nn.hal.grpc_socket_path=/data/vendor/neuralnetworks/ai.socket \
    persist.vendor.lic.device=/dev/dri/renderD129
