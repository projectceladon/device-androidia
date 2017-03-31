LOCAL_PATH := $(call my-dir)

###########################################
# Audio stack Package
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_configuration_files
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    audio_policy.conf \
    mixer_paths.xml

include $(BUILD_PHONY_PACKAGE)

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy.conf
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := audio_policy.conf
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio HAL Custom configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := mixer_paths.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := mixer_paths.xml
include $(BUILD_PREBUILT)
###########################################
