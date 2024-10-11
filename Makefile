# Project configuration
PROJECT_NAME = ClothiqApp
SCHEME = $(PROJECT_NAME)
SDK = iphonesimulator
DESTINATION = "platform=iOS Simulator,name=iPhone 14 Pro"

# Default target: build the app
build:
	@echo "Building $(PROJECT_NAME)..."
	xcodebuild \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		-destination $(DESTINATION) \
		clean build

# Clean build artifacts
clean:
	@echo "Cleaning project..."
	xcodebuild \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(SCHEME) \
		clean

# Run the app on the simulator
run: build
	@echo "Running $(PROJECT_NAME) on simulator..."
	xcrun simctl boot "iPhone 14 Pro"
	xcrun simctl install booted build/Build/Products/Debug-iphonesimulator/$(PROJECT_NAME).app
	xcrun simctl launch booted $(BUNDLE_ID)

# Open the project in Xcode
open:
	@echo "Opening $(PROJECT_NAME) in Xcode..."
	open $(PROJECT_NAME).xcodeproj

# Archive the app for release
archive:
	@echo "Archiving $(PROJECT_NAME)..."
	xcodebuild \
		-project $(PROJECT_NAME).xcodeproj \
		-scheme $(SCHEME) \
		-sdk $(SDK) \
		-archivePath build/$(PROJECT_NAME).xcarchive \
		archive

# Generate IPA for App Store distribution
ipa: archive
	@echo "Exporting IPA..."
	xcodebuild \
		-exportArchive \
		-archivePath build/$(PROJECT_NAME).xcarchive \
		-exportPath build/$(PROJECT_NAME) \
		-exportOptionsPlist ExportOptions.plist

.PHONY: build clean run open archive ipa
