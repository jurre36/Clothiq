ARCHS := arm64
PACKAGE_FORMAT := ipa
TARGET := iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Clothiq






SparseBox_FILES = \
  ClothiqApp.swift \
  Views/ContentView.swift \
  Views/RegisterPersonalInfoView.swift \
  Views/RegisterEmailView.swift \
  Views/LoginView.swift
  

Clothiq_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/application.mk
