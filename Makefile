ARCHS := arm64
PACKAGE_FORMAT := ipa
TARGET := iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Clothiq

# Source files for the application
Clothiq_FILES = \
  ClothiqApp.swift \
  Views/ContentView.swift \
  Views/RegisterPersonalInfoView.swift \
  Views/RegisterEmailView.swift \
  Views/LoginView.swift

# Required frameworks for the app
Clothiq_FRAMEWORKS = UIKit

# Compiler and linker flags
Clothiq_CFLAGS = -fcommon -fobjc-arc
Clothiq_LDFLAGS = -L$(THEOS_OBJ_DIR) -rpath @executable_path/Frameworks
Clothiq_CODESIGN_FLAGS = -Sentitlements.plist

include $(THEOS_MAKE_PATH)/application.mk
