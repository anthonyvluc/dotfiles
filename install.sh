#!/usr/bin/env bash

# Import library helper functions.
source ./lib/echos.sh
source ./lib/utils.sh

# Determine operating system and package manager.
bot "Analyzing system..."
if [[ `uname` == 'Darwin' ]]; then
    # MacOS
    ok "System == Darwin"

    # Install XCode
    bot "Ensuring build/install tools are available"
    # TODO: check this
    #xcode-select --install 2>&1 > /dev/null
    #sudo xcode-select -s /Applications/Xcode.app/Contents/Developer 2>&1 > /dev/null
    #sudo xcodebuild -license accept 2>&1 > /dev/null

    # Check for Homebrew, and install if we don't have it.
    running "Checking Homebrew..."
    brew_bin=$(which brew) 2>&1 > /dev/null
    if [[ $? != 0 ]]; then
        action "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [[ $? != 0 ]]; then
            error "Unable to install Homebrew, aborting script $0"
            exit 2
        fi
    else
        ok
        bot "Homebrew"
        ask "Run brew update && upgrade?"
        if [[ $? == 0 ]]; then
            action "Updating Homebrew"
            brew update
            ok "homebrew updated"
            action "Updating brew packages"
            brew upgrade
            ok "brews upgraded"
        else
            ok "Skipped brew package upgrades."
        fi
    fi

else
    # Linux
    ok "System == Linux"

    # TODO: Handle various Linux flavors.

fi


