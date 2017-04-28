LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#include kernel/xiaomi/leo/AndroidKernel.mk

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/xiaomi/leo/AndroidBoardVendor.mk

#Work areound for the failure of making KERNEL_OBJ/usr directory 
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# WiFi symlinks
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/qca_cld; \
        ln -sf  /system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /system/etc/wifi/WCNSS_qcom_cfg.ini \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini; \
        ln -sf /persist/wlan_mac.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/wlan_mac.bin;)
# END WiFi symlinks

# IMS lib symlink
IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so

IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)
# END IMS lib symlink


