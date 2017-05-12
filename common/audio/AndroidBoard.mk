LOCAL_PATH := $(call my-dir)

# audio hardware is not discoverable, select hardware or use basic default
AUDIO_HARDWARE := default
#AUDIO_HARDWARE := PCH-CX20724
# Next configuration is used for Intel NUC6i5SYH
#AUDIO_HARDWARE := PCH-ALC283
#AUDIO_HARDWARE := nuc-skull-canyon

###########################################
# Audio stack Packages
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_configuration_files
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    audio_policy_configuration_files \
    audio_settings_configuration_files

include $(BUILD_PHONY_PACKAGE)

###########################################
# Audio Policy Configuration files
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_configuration_files
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    a2dp_audio_policy_configuration.xml \
    r_submix_audio_policy_configuration.xml \
    stub_audio_policy_configuration.xml \
    usb_audio_policy_configuration.xml \
    audio_policy_volumes.xml \
    default_volume_tables.xml \
    audio_policy_configuration.xml

include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := a2dp_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_volumes.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := default_volume_tables.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := r_submix_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := stub_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := usb_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := $(AUDIO_HARDWARE)/policy/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

###########################################

###########################################
# Audio HAL Custom configuration files
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_settings_configuration_files
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    mixer_paths_0.xml

include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := mixer_paths_0.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := $(AUDIO_HARDWARE)/mixer_paths_0.xml
include $(BUILD_PREBUILT)
###########################################
