PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_PACKAGES += auditd

$(call prepend-product-if-exists, vendor/bass0324/product.mk)

ifneq ($(filter lineage_mata,$(TARGET_PRODUCT)),)
GAPPS_VARIANT := nano
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

PRODUCT_COPY_FILES += \
  vendor/opengapps/sources/arm/lib/28/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
  vendor/opengapps/sources/arm/lib/28/libsketchology_native.so:system/lib/libsketchology_native.so \
  vendor/opengapps/sources/arm64/lib64/28/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
  vendor/opengapps/sources/arm64/lib64/28/libsketchology_native.so:system/lib64/libsketchology_native.so
endif

PRODUCT_COPY_FILES += \
    vendor/extra/rootdir/etc/init/ttl.rc:system/etc/init/ttl.rc

# Themes
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_PROPERTY_OVERRIDES += ro.boot.vendor.overlay.theme=com.google.android.theme.pixel
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.ime.theme_id=5
PRODUCT_PACKAGES += \
    PixelTheme
