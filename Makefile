ARCHS := arm64
PACKAGE_FORMAT := ipa
TARGET := iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Clothiq

# Source files for the application
Clothiq_FILES = \
  Sources/ClothiqApp.swift \
  Sources/ContentView.swift \
  Sources/RegisterPersonalInfoView.swift \
  Sources/RegisterEmailView.swift \
  Sources/LoginView.swift

# Required frameworks for the app
Clothiq_FRAMEWORKS = UIKit SwiftUI


# Compiler and linker flags
Clothiq_CFLAGS = -fcommon -fobjc-arc
Clothiq_LDFLAGS = -L$(THEOS_OBJ_DIR) -rpath @executable_path/Frameworks
Clothiq_CODESIGN_FLAGS = -Sentitlements.plist

include $(THEOS_MAKE_PATH)/application.mk
