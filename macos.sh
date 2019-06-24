#!/usr/bin/env bash

macos() {


    ############################################
    bot "Tweaking Standard System Settings"
    ############################################

    running "Always boot in verbose mode (not MacOS GUI mode)"
    sudo nvram boot-args="-v"; ok

    running "Allow 'locate' command"
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist > /dev/null 2>&1; ok

    running "Set standby delay to 24 hours (default is 1 hour)"
    sudo pmset -a standbydelay 86400; ok

    running "Disable the sound effects on boot"
    sudo nvram SystemAudioVolume=" "; ok

    running "Menu bar: disable transparency"
    defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false; ok

    running "Save to disk (not to iCloud) by default"
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false; ok

    running "Automatically quit printer app once the print jobs complete"
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true; ok

    running "Disable the “Are you sure you want to open this application?” dialog"
    defaults write com.apple.LaunchServices LSQuarantine -bool false; ok

    running "Remove duplicates in the “Open With” menu (also see 'lscleanup' alias)"
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; ok

    running "Disable automatic termination of inactive apps"
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true; ok

    running "Disable the crash reporter"
    defaults write com.apple.CrashReporter DialogType -string "none"; ok

    running "Reveal IP, hostname, OS, etc. when clicking clock in login window"
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName; ok

    # running "Restart automatically if the computer freezes"
    # sudo systemsetup -setrestartfreeze on; ok

    running "Never go into computer sleep mode"
    sudo systemsetup -setcomputersleep Off > /dev/null; ok

    running "Check for software updates daily, not just once per week"
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1; ok

    # running "Disable Notification Center and remove the menu bar icon"
    # launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist > /dev/null 2>&1; ok

    running "Disable smart quotes as they’re annoying when typing code"
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false; ok

    running "Disable smart dashes as they’re annoying when typing code"
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false; ok

    ############################################
    bot "Trackpad, Mouse, Keyboard, Bluetooth Accessories, and Input"
    ############################################

    running "Trackpad: enable tap to click for this user and for the login screen"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; ok

    running "Trackpad: map bottom right corner to right-click"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true; ok

    running "Enable 'natural' (Lion-style) scrolling"
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true; ok

    running "Increase sound quality for Bluetooth headphones/headsets"
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40; ok

    running "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3; ok

    # running "Use scroll gesture with the Ctrl (^) modifier key to zoom"
    # defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
    # defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144; ok
    # running "Follow the keyboard focus while zoomed in"
    # defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true; ok

    running "Disable press-and-hold for keys in favor of key repeat"
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false; ok

    running "Set a blazingly fast keyboard repeat rate"
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 10; ok

    running "Set language and text formats (english/US)"
    defaults write NSGlobalDomain AppleLanguages -array "en"
    defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
    defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
    defaults write NSGlobalDomain AppleMetricUnits -bool true; ok

    running "Disable auto-correct"
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false; ok

    ############################################
    bot "Screen Configuration"
    ############################################

    running "Require password immediately after sleep or screen saver begins"
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0; ok

    # running "Save screenshots to the desktop"
    # defaults write com.apple.screencapture location -string "${HOME}/Desktop"; ok

    running "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
    defaults write com.apple.screencapture type -string "png"; ok

    running "Disable shadow in screenshots"
    defaults write com.apple.screencapture disable-shadow -bool true; ok

    running "Enable subpixel font rendering on non-Apple LCDs"
    defaults write NSGlobalDomain AppleFontSmoothing -int 2; ok

    running "Enable HiDPI display modes (requires restart)"
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true; ok

    ############################################
    bot "Finder Configuration"
    ############################################

    running "Allow quitting via ⌘ + Q; doing so will also hide desktop icons"
    defaults write com.apple.finder QuitMenuItem -bool true; ok

    running "Disable window animations and Get Info animations"
    defaults write com.apple.finder DisableAllAnimations -bool true; ok

    # running "Set Desktop as the default location for new Finder windows"
    # For other paths, use 'PfLo' and 'file:///full/path/here/'
    # defaults write com.apple.finder NewWindowTarget -string "PfDe"
    # defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"; ok

    running "Show hidden files by default"
    defaults write com.apple.finder AppleShowAllFiles -bool true; ok

    running "Show all filename extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true; ok

    running "Show status bar"
    defaults write com.apple.finder ShowStatusBar -bool true; ok

    running "Show path bar"
    defaults write com.apple.finder ShowPathbar -bool true; ok

    running "Allow text selection in Quick Look"
    defaults write com.apple.finder QLEnableTextSelection -bool true; ok

    running "Display full POSIX path as Finder window title"
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; ok

    running "When performing a search, search the current folder by default"
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"; ok

    running "Disable the warning when changing a file extension"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false; ok

    running "Enable spring loading for directories"
    defaults write NSGlobalDomain com.apple.springing.enabled -bool true; ok

    running "Remove the spring loading delay for directories"
    defaults write NSGlobalDomain com.apple.springing.delay -float 0; ok

    running "Avoid creating .DS_Store files on network volumes"
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true; ok

    running "Disable disk image verification"
    defaults write com.apple.frameworks.diskimages skip-verify -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true; ok

    running "Automatically open a new Finder window when a volume is mounted"
    defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
    defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true; ok

    running "Use list view in all Finder windows by default"
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"; ok

    running "Disable the warning before emptying the Trash"
    defaults write com.apple.finder WarnOnEmptyTrash -bool false; ok

    running "Empty Trash securely by default"
    defaults write com.apple.finder EmptyTrashSecurely -bool true; ok

    # running "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
    # defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true; ok

    running "Show the ~/Library folder"
    chflags nohidden ~/Library; ok

    running "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
      General -bool true \
      OpenWith -bool true \
      Privileges -bool true; ok

}

# Check if running manually and not from install script.
INSTANCE="$(basename $0)"
echo $INSTANCE
if [[ "$INSTANCE" == "macos.sh" ]]; then

    # Ask for the administrator password upfront.
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Import utilities.
    source ./lib/echos.sh

    # Apply tweaks.
    macos
fi
