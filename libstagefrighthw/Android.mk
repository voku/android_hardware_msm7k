#
# Copyright (C) 2009 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_BOARD_PLATFORM),msm7x30)
LOCAL_SRC_FILES := \
    stagefright_surface_output_msm7x30.cpp \
    QComHardwareOverlayRenderer.cpp
else
LOCAL_SRC_FILES := \
    stagefright_surface_output_msm72xx.cpp \
    QComOMXPlugin.cpp                      \
    QComHardwareRenderer.cpp
endif


LOCAL_CFLAGS := $(PV_CFLAGS_MINUS_VISIBILITY) -O3 -march=armv6zk -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp

LOCAL_C_INCLUDES:= \
        $(TOP)/external/opencore/extern_libs_v2/khronos/openmax/include

LOCAL_SHARED_LIBRARIES :=       \
        libbinder               \
        libutils                \
        libcutils               \
        libdl                   \
        libui                   \
        libhardware

ifneq ($(BOARD_USES_ECLAIR_LIBCAMERA),true)
    LOCAL_SHARED_LIBRARIES += \
    	libsurfaceflinger_client
endif

LOCAL_MODULE := libstagefrighthw

include $(BUILD_SHARED_LIBRARY)

