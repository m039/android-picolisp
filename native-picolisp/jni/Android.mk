LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS += -c -O2 -pipe \
    -falign-functions -fomit-frame-pointer -fno-strict-aliasing \
    -W -Wimplicit -Wreturn-type -Wunused -Wformat \
    -Wuninitialized -Wstrict-prototypes \
    -D_GNU_SOURCE  -D_FILE_OFFSET_BITS=64 -D_OS='"Linux"'

LOCAL_MODULE    := picolisp
LOCAL_SRC_FILES :=  main.c gc.c apply.c flow.c sym.c subr.c big.c io.c net.c tab.c ht.c


include $(BUILD_EXECUTABLE)
