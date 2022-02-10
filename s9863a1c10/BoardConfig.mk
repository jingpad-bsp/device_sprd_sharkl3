#
# Copyright 2015 The Android Open-Source Project
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

CHIP_NAME :=    sharkl3

include device/sprd/sharkl3/common/BoardCommon.mk

#chipram tool for arm64
TOOLCHAIN_64 := true

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

sprdiskexist := $(shell if [ -f $(TOPDIR)sprdisk/Makefile -a "$(TARGET_BUILD_VARIANT)" = "userdebug" ]; then echo "exist"; else echo "notexist"; fi;)
ifneq ($(sprdiskexist), exist)
TARGET_NO_SPRDISK := true
else
TARGET_NO_SPRDISK := false
endif
SPRDISK_BUILD_PATH := sprdisk/


# ext4 partition layout
#BOARD_VENDORIMAGE_PARTITION_SIZE := 419430400
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR=vendor
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3145728000
BOARD_CACHEIMAGE_PARTITION_SIZE := 150000000
BOARD_PRODNVIMAGE_PARTITION_SIZE := 10485760
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_DTBIMG_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODNVIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_SYSTEMIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
TARGET_PRODNVIMAGES_SPARSE_EXT_DISABLED := true
TARGET_CACHEIMAGES_SPARSE_EXT_DISABLED := false
USE_SPRD_SENSOR_HUB := true
#BOARD_PRODUCTIMAGE_PARTITION_SIZE :=419430400
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT=product

BOARD_SOCKOIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMKOIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SOCKOIMAGE_PARTITION_SIZE := 78643200 # 75M
BOARD_ODMKOIMAGE_PARTITION_SIZE := 26214400 # 25M

#creates the metadata directory
BOARD_USES_METADATA_PARTITION := true

#start camera configuration
#------section 1: software structure------
TARGET_BOARD_SPRD_EXFRAMEWORKS_SUPPORT := true

#HAL1.0  HAL2.0  HAL3.0
TARGET_BOARD_CAMERA_HAL_VERSION := HAL3.0


#support 64bit isp
TARGET_BOARD_CAMERA_ISP_64BIT := true

# temp for isp3.0
TARGET_BOARD_CAMERA_ISP_VERSION := 2.5

TARGET_BOARD_IS_SC_FPGA := false

#camera offline structure
TARGET_BOARD_CAMERA_OFFLINE := true


#------section 2: sensor & flash config------

#camera auto detect sensor
TARGET_BOARD_CAMERA_AUTO_DETECT_SENSOR := true

#select camera 2M,3M,5M,8M,13M,16M,21M
CAMERA_SUPPORT_SIZE := 16M
FRONT_CAMERA_SUPPORT_SIZE := 8M
BACK_EXT_CAMERA_SUPPORT_SIZE := 8M
FRONT_EXT_CAMERA_SUPPORT_SIZE :=
TARGET_BOARD_NO_FRONT_SENSOR := false
TARGET_BOARD_SENSOR2_SUPPORT := true
TARGET_BOARD_SENSOR3_SUPPORT := true

#camera dual sensor
TARGET_BOARD_CAMERA_DUAL_SENSOR_MODULE := true
#dual camera 3A sync
#TARGET_BOARD_CONFIG_CAMERA_DUAL_SYNC := true
#sensor multi-instance
#TARGET_BOARD_CAMERA_SENSOR_MULTI_INSTANCE_SUPPORT := ture
TARGET_BOARD_CAMERA_SENSOR_MULTI_INSTANCE_SUPPORT := false

#4in1
TARGET_BOARD_CAMERA_4IN1 := true

#tuning param support list
TUNING_PARAM_LIST := "gc02m1b_js_1_param,gc2375_js_2_param,gc2375_wj_2_param, \
    gc2385_wj_1_param,hi846_gj_1_param,hi1336_m0_param,hi1336_s0_param,ov13853_m1_param, \
    ov13853_s1_param,gc8034_gj_2_param"

#4in1 ov4c
TARGET_BOARD_SENSOR_OV4C := true

#ams
TARGET_CAMERA_SENSOR_CCT := "ams_tcs3430"

#flash led  feature
TARGET_BOARD_CAMERA_FLASH_LED_0 := true # flash led0 config
TARGET_BOARD_CAMERA_FLASH_LED_1 := true # flash led1 config

#flash IC
TARGET_BOARD_CAMERA_FLASH_TYPE := ocp8137

#front flash type
#lcd,led,flash
TARGET_BOARD_FRONT_CAMERA_FLASH_TYPE := lcd

#Range of value 0~31
CAMERA_TORCH_LIGHT_LEVEL := 16

#PDAF feature
TARGET_BOARD_CAMERA_DCAM_PDAF := true
#TARGET_BOARD_CAMERA_PDAF_TYPE := 3
TARGET_BOARD_CAMERA_PDAF_TYPE := 0

#sensor otp
TARGET_BOARD_CAMERA_SENSOR_OTP := true

#------section 3: feature config------
#select camera zsl cap mode
TARGET_BOARD_CAMERA_CAPTURE_MODE := false

ifneq ($(strip $(CMCC_PROJECT)),true)
#face detect
TARGET_BOARD_CAMERA_FACE_DETECT := true
#UCAM feature
TARGET_BOARD_CAMERA_FACE_BEAUTY := true

#hdr capture
TARGET_BOARD_CAMERA_HDR_CAPTURE := true
TARGET_BOARD_CAMERA_SUPPORT_AUTO_HDR := true

#hdr version
TARGET_BOARD_SPRD_HDR_VERSION := 2

#BOKEH feature
TARGET_BOARD_BOKEH_MODE_SUPPORT := true
TARGET_BOARD_ARCSOFT_BOKEH_MODE_SUPPORT := false
TARGET_BOARD_BOKEH_CROP := true

#bokeh hdr feature
TARGET_BOARD_BOKEH_HDR_MODE_SUPPORT := false

#portrait
TARGET_BOARD_PORTRAIT_SUPPORT := true

#portrait_single
TARGET_BOARD_PORTRAIT_SINGLE_SUPPORT := true

#covered camera enble
TARGET_BOARD_COVERED_SENSOR_SUPPORT := false

#blur mode enble
TARGET_BOARD_BLUR_MODE_SUPPORT := true
endif
#3dnr capture
TARGET_BOARD_CAMERA_3DNR_CAPTURE := false

#3night 3dnr type
#value:1--prev_hw_cap_hw
#value:2--prev_hw_cap_sw
#value:3--prev_null_cap_hw
TARGET_BOARD_CAMERA_NIGHT_3DNR_TYPE :=1

#EIS
TARGET_BOARD_CAMERA_EIS := true
CAMERA_EIS_BOARD_PARAM := "sp9863a-1"

#GYRO
TARGET_BOARD_CAMERA_GYRO := true

#support auto anti-flicker
TARGET_BOARD_CAMERA_ANTI_FLICKER := false

#uv denoise
TARGET_BOARD_CAMERA_UV_DENOISE := false

#select continuous auto focus
TARGET_BOARD_CAMERA_CAF := false

#select camera support autofocus
TARGET_BOARD_CAMERA_AUTOFOCUS := false

#support 3d face
TARGET_BOARD_3DFACE_SUPPORT := true

#supprt ai sence
TARGET_BOARD_CAMERA_AI := true

#support superwide
TARGET_BOARD_CAMERA_SUPPORT_ULTRA_WIDE := true

#Optics zoom
TARGET_BOARD_OPTICSZOOM_SUPPORT := true

#Multi Camera
TARGET_BOARD_MULTICAMERA_SUPPORT := true

#support wide superwide
TARGET_BOARD_WIDE_ULTRAWIDE_SUPPORT := true

#faceid
TARGET_BOARD_FACE_UNLOCK_SUPPORT := true
TARGET_BOARD_DUAL_FACE_UNLOCK_SUPPORT := true

#watermark,logo watermark, time watermark
TARGET_BOARD_LOGOWATERMARK_SUPPORT := true
TARGET_BOARD_TIMEWATERMARK_SUPPORT := true

#------section 4: optimize config------
#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
TARGET_BOARD_FRONT_CAMERA_ROTATION := false

#image angle in different project
TARGET_BOARD_CAMERA_ADAPTER_IMAGE := 180

#pre_allocate capture memory
TARGET_BOARD_CAMERA_PRE_ALLOC_CAPTURE_MEM := false
#low capture memory
TARGET_BOARD_LOW_CAPTURE_MEM := true

#set camera recording frame rate dynamic
TARGET_BOARD_CONFIG_CAMRECORDER_DYNAMIC_FPS := false

#power optimization
TARGET_BOARD_CAMERA_POWER_OPTIMIZATION := false

#Slowmotion optimize
TARGET_BOARD_SPRD_SLOWMOTION_OPTIMIZE := true

#------section 5: other misc config------

#open dummy when camera hal not ready in bringup
TARGET_BOARD_CAMERA_FUNCTION_DUMMY := false

#MEET JPG 16 BIT ALIGNMENT
TARGET_BOARD_CAMERA_MEET_JPG_ALIGNMENT := true

#Adjust fps in range
TARGET_BOARD_ADJUST_FPS_IN_RANGE := true

#------section 6: kernel module config------
#use module for kernel driver or not
TARGET_BOARD_CAMERA_MODULAR := true

#modulars & version config
#TARGET_BOARD_CAMERA_ISP_MODULAR_KERNEL := dcam_if_r5p0_isp_r6p12
#TARGET_BOARD_CAMERA_CPP_MODULAR_KERNEL := lite_r4p0
#TARGET_BOARD_CAMERA_SENSOR_MODULAR_KERNEL := yes
#TARGET_BOARD_CAMERA_SENSOR_KERNEL_COMPAT := true
#TARGET_BOARD_CAMERA_CSI_VERSION := r2p0
TARGET_BOARD_CAMERA_CPP_USER_DRIVER := true
TARGET_BOARD_CAMERA_CPP_MODULAR_KERNEL := lite_r5p0
# ===============end of camera configuration ===============
#GNSS GPS
BOARD_USE_SPRD_GNSS := ge2

#SPRD: SUPPORT EXTERNAL WCN
SPRD_CP_LOG_WCN := MARLIN2

# select FMRadio
BOARD_USE_SPRD_FMAPP := false
BOARD_HAVE_FM_BCM := false
BOARD_HAVE_BLUETOOTH := true

# select sdcard
TARGET_USE_SDCARDFS := false
USE_VENDOR_LIB := true

#Audio NR enable
AUDIO_RECORD_NR := true

# WIFI configs
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sp9832e
WIFI_DRIVER_FW_PATH_PARAM   := "/data/vendor/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "$(PRODUCT_VENDOR_KO_MOUNT_POINT)/socko/sprdwl_ng.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl_ng"
BOARD_SEPOLICY_DIRS += device/sprd/sharkl3/common/sepolicy #\
    #device/generic/goldfish/sepolicy/common
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/sprd/sharkl3/common/plat_sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/sprd/sharkl3/common/plat_sepolicy/public

#SPRD: acquire powerhint during playing video
POWER_HINT_VIDEO_CONTROL_CORE := true

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_USES_MKE2FS := true
USE_SPRD_SENSOR_HUB := true
# Config Sensor driver
SENSOR_HUB_ACCELEROMETER := icm20600_l3_1c10
SENSOR_HUB_GYROSCOPE := icm20600_l3_1c10
SENSOR_HUB_LIGHT := ltr553als
SENSOR_HUB_MAGNETIC := akm09918
SENSOR_HUB_PROXIMITY := ltr553iwhale2
SENSOR_HUB_PRESSURE := null
SENSOR_HUB_CALIBRATION := sp9863a
# Config Sensor feature: sensorlist
SENSOR_HUB_FEATURE := hub

# WFD max support 720P
TARGET_BOARD_WFD_MAX_SUPPORT_720P := true

#SUPPORT LOWPOWER WITH LCD 30 FPS
LOWPOWER_DISPLAY_30FPS :=true

BOARD_IOSNOOP_DISABLE := true
#face detect version 0--old Algorithm library 1--new Algorithm library
TARGET_BOARD_SPRD_FD_VERSION := 1
#SUPPORT AUTO 3DNR
TARGET_BOARD_CAMERA_SUPPORT_AUTO_3DNR := true
