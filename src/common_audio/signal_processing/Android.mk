# Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
# Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file in the root of the source
# tree. An additional intellectual property rights grant can be found
# in the file PATENTS.  All contributing project authors may
# be found in the AUTHORS file in the root of the source tree.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/../../../android-webrtc.mk

LOCAL_ARM_MODE := arm
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE := libwebrtc_spl
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
    auto_corr_to_refl_coef.c \
    auto_correlation.c \
    complex_fft.c \
    complex_bit_reverse.c \
    copy_set_operations.c \
    cross_correlation.c \
    division_operations.c \
    dot_product_with_scale.c \
    downsample_fast.c \
    energy.c \
    filter_ar.c \
    filter_ar_fast_q12.c \
    filter_ma_fast_q12.c \
    get_hanning_window.c \
    get_scaling_square.c \
    ilbc_specific_functions.c \
    levinson_durbin.c \
    lpc_to_refl_coef.c \
    min_max_operations.c \
    randomization_functions.c \
    refl_coef_to_lpc.c \
    resample.c \
    resample_48khz.c \
    resample_by_2.c \
    resample_by_2_internal.c \
    resample_fractional.c \
    spl_sqrt.c \
    spl_version.c \
    splitting_filter.c \
    sqrt_of_one_minus_x_squared.c \
    vector_scaling_operations.c

# Flags passed to both C and C++ files.
LOCAL_CFLAGS := \
    $(MY_WEBRTC_COMMON_DEFS)

LOCAL_CFLAGS_arm := $(MY_WEBRTC_COMMON_DEFS_arm)
LOCAL_CFLAGS_x86 := $(MY_WEBRTC_COMMON_DEFS_x86)
LOCAL_CFLAGS_mips := $(MY_WEBRTC_COMMON_DEFS_mips)
LOCAL_CFLAGS_arm64 := $(MY_WEBRTC_COMMON_DEFS_arm64)
LOCAL_CFLAGS_x86_64 := $(MY_WEBRTC_COMMON_DEFS_x86_64)
LOCAL_CFLAGS_mips64 := $(MY_WEBRTC_COMMON_DEFS_mips64)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/../..

ifeq ($(ARCH_ARM_HAVE_NEON),true)
LOCAL_SRC_FILES_arm += \
    min_max_operations_neon.c
LOCAL_CFLAGS_arm += \
    $(MY_ARM_CFLAGS_NEON)
endif

my_as_src := spl_sqrt_floor.s
my_c_src := spl_sqrt_floor.c
LOCAL_SRC_FILES_arm += $(my_as_src)
LOCAL_SRC_FILES_x86 += $(my_c_src)
LOCAL_SRC_FILES_mips += $(my_c_src)
LOCAL_SRC_FILES_arm64 += $(my_c_src)
LOCAL_SRC_FILES_x86_64 += $(my_c_src)
LOCAL_SRC_FILES_mips64 += $(my_c_src)

ifdef WEBRTC_STL
LOCAL_NDK_STL_VARIANT := $(WEBRTC_STL)
LOCAL_SDK_VERSION := 14
LOCAL_MODULE := $(LOCAL_MODULE)_$(WEBRTC_STL)
endif

include $(BUILD_STATIC_LIBRARY)
