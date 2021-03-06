BASE_PATH := $(call my-dir)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

# setup for skia optimizations
#
LOCAL_CFLAGS += -funroll-loops -frename-registers -fgcse-sm -fgcse-las

ifneq ($(ARCH_ARM_HAVE_VFP),true)
	LOCAL_CFLAGS += -DSK_HARDWARE_FLOAT
endif

ifeq ($(ARCH_ARM_HAVE_NEON),true)
	LOCAL_CFLAGS += -D__ARM_HAVE_NEON
endif

# our source files
#
LOCAL_SRC_FILES:= \
	bitmap.cpp

LOCAL_SHARED_LIBRARIES := \
    libandroid_runtime \
    libskia

LOCAL_C_INCLUDES += \
	external/skia/include/core \
	frameworks/base/native/include \
	frameworks/base/core/jni/android/graphics

LOCAL_MODULE:= libjnigraphics

include $(BUILD_SHARED_LIBRARY)

