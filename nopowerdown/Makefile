include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoPowerDown
NoPowerDown_FILES = NPDRootListController.m
NoPowerDown_INSTALL_PATH = /Library/PreferenceBundles
NoPowerDown_FRAMEWORKS = UIKit
NoPowerDown_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoPowerDown.plist$(ECHO_END)
