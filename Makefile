THEOS_DEVICE_IP = 10.0.0.245
TARGET := iphone:clang:latest:15.0
ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME=rootless
INSTALL_TARGET_PROCESSES = Video Star


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TestStar

TestStar_FILES = Tweak.x
TestStar_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
