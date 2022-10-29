LOCAL_PATH:= $(call my-dir)

# build input_uvc.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    utils.c \
    plugins/input_uvc/v4l2uvc.c \
    plugins/input_uvc/jpeg_utils.c \
    plugins/input_uvc/dynctrl.c \
    plugins/input_uvc/input_uvc.c \

    
LOCAL_C_INCLUDES := \
    mjpg_streamer.h \
    utils.h \
    plugins/output.h \
    plugins/input.h \
    plugins/input_uvc/huffman.h \
    plugins/input_uvc/uvc_compat.h \
    plugins/input_uvc/v4l2uvc.h \
    plugins/input_uvc/jpeg_utils.h \
    plugins/input_uvc/dynctrl.h \
    jpeglib.h
    
LOCAL_CFLAGS := -O1 -DLINUX -D_GNU_SOURCE -Wall -shared -fPIC -ljpeg -Wno-error=unused-parameter -Wno-error=unused-variable

LOCAL_SHARED_LIBRARIES := libjpeg

LOCAL_MODULE := input_uvc

include $(BUILD_SHARED_LIBRARY)

# build output_http.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    plugins/output_http/httpd.c \
    plugins/output_http/output_http.c

    
LOCAL_C_INCLUDES := \
    mjpg_streamer.h \
    utils.h \
    plugins/output.h \
    plugins/input.h \
    plugins/output_http/httpd.h
    
LOCAL_CFLAGS := -O1 -DLINUX -D_GNU_SOURCE -Wall -shared -fPIC -Wno-error=unused-parameter -Wno-error=pointer-arith

LOCAL_MODULE := output_http

include $(BUILD_SHARED_LIBRARY)

# build mjpg_streamer
include $(CLEAR_VARS)

LOCAL_MODULE := mjpg_streamer

LOCAL_SRC_FILES := utils.c mjpg_streamer.c

LOCAL_C_INCLUDES := utils.h mjpg_streamer.h

LOCAL_CFLAGS := -O2 -DLINUX -D_GNU_SOURCE -Wall -Wno-error=date-time -Wno-error=unused-parameter

LOCAL_SHARED_LIBRARIES := libjpeg

include $(BUILD_EXECUTABLE)
