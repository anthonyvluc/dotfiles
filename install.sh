#!/usr/bin/env bash

# Import library helper functions.
source ./lib/echos.sh
source ./lib/utils.sh

# Do we need to ask for sudo password or is it already passwordless?
grep -q 'NOPASSWD:     ALL' /etc/sudoers.d/$LOGNAME > /dev/null 2>&1
if [ $? -ne 0 ]; then
  bot "No sudoer file"
  sudo -v
  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

#############################################
# Install Packages and Programs             #
#############################################

# Determine operating system and package manager.
bot "Analyzing system..."
if [[ `uname` == 'Darwin' ]]; then
    # MacOS
    ok "System == Darwin"

    # Install XCode
    bot "Ensuring build/install tools are available"
    xcode-select --install 2>&1 > /dev/null
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer 2>&1 > /dev/null
    sudo xcodebuild -license accept 2>&1 > /dev/null

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

    # Install Homebrew packages.
    action "Install Brew Packages..."
    # source ./brew.sh
    # brew

else
    # Linux
    ok "System == Linux"

    # TODO: Handle various Linux flavors.
fi

bot "Setting Default Shell"
CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  bot "Setting newer Homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
  ok
fi

bot "Dotfiles Setup"
ask "symlink ./home/* files in ~/ (these are the dotfiles)?"
if [[ $? == 0 ]]; then
    action "Creating symlinks for project files..."
    pushd home > /dev/null 2>&1 # Push home/ to directory stack
    now=$(date +"%Y.%m.%d.%H.%M.%S")

    for file in .*; do
        if [[ $file == "." || $file == ".." ]]; then
            continue
        fi
        running "~/$file"
        # if the file exists:
        if [[ -e ~/$file ]]; then
            mkdir -p ~/.dotfiles_backup/$now
            mv ~/$file ~/.dotfiles_backup/$now/$file
            echo "backup saved as ~/.dotfiles_backup/$now/$file"
        fi
        # symlink might still exist
        unlink ~/$file > /dev/null 2>&1
        # create the link
        ln -s ~/.dotfiles/home/$file ~/$file
        echo -en '\tlinked';ok
    done

    popd > /dev/null 2>&1 # Pop from directory stack
fi

bot "VIM Setup"
ask "Do you want to install vim plugins now? [y|N] "
if [[ $? == 0 ]]; then
  bot "Installing vim plugins"
  vim +PlugInstall > /dev/null 2>&1
  ok
else
  ok "skipped. Install by running :PlugInstall within vim"
fi

#############################################
# System Settings                           #
#############################################
bot "System Settings"
source ./macos.sh
macos

bot "Installation successfully completed!"
