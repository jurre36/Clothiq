ARCHS := arm64
PACKAGE_FORMAT := ipa
TARGET := iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Clothiq
LIBRARY_NAME = libEMProxy libimobiledevice

# Link em_proxy separately as it has duplicated symbols with minimuxer
libEMProxy_FILES = lib/empty.swift
libEMProxy_LDFLAGS = -force_load lib/libem_proxy-ios.a -install_name @rpath/libEMProxy.dylib
libEMProxy_FRAMEWORKS = Security
libEMProxy_INSTALL_PATH = /Applications/$(APPLICATION_NAME).app/Frameworks

# libimobiledevice + minimuxer
libimobiledevice_FILES = idevicebackup2.c
libimobiledevice_CFLAGS = -Iinclude
libimobiledevice_LDFLAGS = \
  -force_load lib/libimobiledevice-1.0.a \
  -force_load lib/libimobiledevice-glue-1.0.a \
  -force_load lib/libplist-2.0.a \
  -force_load lib/libusbmuxd-2.0.a \
  -force_load lib/libcrypto.a \
  -force_load lib/libssl.a \
  -force_load lib/libminimuxer-ios.a \
  -Wl,-mllvm,--opaque-pointers \
  -install_name @rpath/libimobiledevice.dylib
libimobiledevice_FRAMEWORKS = Foundation Security SystemConfiguration
libimobiledevice_INSTALL_PATH = /Applications/$(APPLICATION_NAME).app/Frameworks

SparseBox_FILES = \
  ClothiqApp.swift \
  Views/ContentView.swift
  Views/RegisterPersonalInfoView.swift
  Views/RegisterEmailView.swift
  Views/LoginView.swift
  

Clothiq_FRAMEWORKS = UIKit
Clothiq_CFLAGS = -fcommon -fobjc-arc
Clothiq_SWIFTFLAGS = -Iinclude -import-objc-header include/minimuxer-Bridging-Header.h
Clothiq_LDFLAGS = -L$(THEOS_OBJ_DIR) -rpath @executable_path/Frameworks
Clothiq_LIBRARIES = EMProxy imobiledevice
Clothiq_CODESIGN_FLAGS = -Sentitlements.plist
include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/application.mk
