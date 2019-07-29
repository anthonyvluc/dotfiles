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
# Git Configuration                         #
#############################################

bot "Let's update your information in .gitconfig"
grep 'user = GITHUBUSER' ./home/.gitconfig > /dev/null 2>&1
if [[ $? = 0 ]]; then
    read -r -p "What is your GitHub username? " github_username

    full_name=`osascript -e "long user name of (system info)"`

    if [[ -n "$full_name" ]]; then
        first_name=$(echo $full_name | awk '{print $1}');
        last_name=$(echo $full_name | awk '{print $2}');
    fi

    if [[ -z $first_name ]]; then
        first_name=`dscl . -read /Users/$(whoami) | grep FirstName | sed "s/FirstName: //"`
    fi
    if [[ -z $last_name ]]; then
        last_name=`dscl . -read /Users/$(whoami) | grep LastName | sed "s/LastName: //"`
    fi
    email=`dscl . -read /Users/$(whoami) | grep EMailAddress | sed "s/EMailAddress: //"`

    if [[ ! $first_name ]]; then
        response='n'
    else
        echo -e "I see that your full name is $COL_YELLOW$first_name $last_name$COL_RESET"
        read -r -p "Is this correct? [y|N] " response
    fi

    if [[ $response =~ (no|n|N) ]]; then
        read -r -p "What is your first name? " first_name
        read -r -p "What is your last name? " last_name
    fi

    full_name="$first_name $last_name"

    bot "Great $full_name, "
    if [[ ! $email  ]]; then
        response='n'
    else
        echo -e "The best I can make out for your email address is $COL_YELLOW$email$COL_RESET"
        read -r -p "Is this correct? [y|N] " response
    fi

    if [[ $response =~ (no|n|N) ]]; then
        read -r -p "What is your email? " email
        if [[ ! $email ]]; then
            error "You must provide an email to configure .gitconfig"
            exit 1
        fi
    fi

    running "Updating .gitconfig with your info ($COL_YELLOW$full_name, $email, $github_username$COL_RESET)"

    # Test if gnu-sed or MacOS sed
    sed -i "s/GITHUBFULLNAME/$full_name/" ./home/.gitconfig > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        echo
        running "looks like you are using MacOS sed rather than gnu-sed, accommodating"
        sed -i '' "s/GITHUBFULLNAME/$full_name/" ./home/.gitconfig
        sed -i '' 's/GITHUBEMAIL/'$email'/' ./home/.gitconfig
        sed -i '' 's/GITHUBUSER/'$github_username'/' ./home/.gitconfig
        ok
    else
        echo
        bot "looks like you are already using gnu-sed. woot!"
        sed -i 's/GITHUBEMAIL/'$email'/' ./home/.gitconfig
        sed -i 's/GITHUBUSER/'$github_username'/' ./home/.gitconfig
    fi
fi

#############################################
# Install Packages and Programs             #
#############################################

# Determine operating system and package manager.
bot "Analyzing your system to install packages"
if [[ `uname` == 'Darwin' ]]; then
    # MacOS
    ok "System == Darwin"

    # Install XCode
    bot "Ensuring build/install tools are available"
    xcode-select --install 2>&1 > /dev/null
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer 2>&1 > /dev/null
    sudo xcodebuild -license accept 2>&1 > /dev/null

    # Check for Homebrew, and install if we don't have it.
    running "Checking Homebrew"
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
    ask "Install Homebrew packages?"
    if [[ $? == 0 ]]; then
        action "Install Brew Packages"
        source ./go_brew.sh
        go_brew
        ok "brew packages installed"
    fi

else
    # Linux
    ok "System == Linux"

    # TODO: Handle various Linux flavors?
    # Use Linuxbrew?
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

fi

bot "Setting Default Shell"
CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  bot "Setting newer Homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
  ok
fi

#############################################
# Dotfiles Setup                            #
#############################################

bot "Dotfiles Setup"
ask "symlink ./home/* files in ~/ (these are the dotfiles)?"
if [[ $? == 0 ]]; then
    action "Creating symlinks for project files"
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
ask "Do you want to install vim plugins now?"
if [[ $? == 0 ]]; then
  bot "Installing vim plugins"
  vim +PlugInstall +qall > /dev/null 2>&1
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
