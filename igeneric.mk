ENABLE_NATIVEBRIDGE_64BIT := true

$(call inherit-product,$(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product,device/intel/igeneric/device.mk)

# Overrides
PRODUCT_NAME := igeneric
PRODUCT_BRAND := igeneric
PRODUCT_DEVICE := igeneric
PRODUCT_MODEL := Generic igeneric
PRODUCT_MANUFACTURER := Intel

