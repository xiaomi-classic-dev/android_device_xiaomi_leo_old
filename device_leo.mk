$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/leo/leo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/leo/overlay

$(call inherit-product, build/target/product/full.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xiaomi/leo/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_leo
PRODUCT_DEVICE := leo
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi Note Pro
