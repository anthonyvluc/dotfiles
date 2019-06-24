#!/usr/bin/env bash
# TODO: figure out how to include this

# Initial #

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# brew install bash
# brew install bash-completion2

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install gmp

# Essentials #
brew install \
    bash \
    cmake \
    coreutils \
    curl \
    dos2unix \
    fzf \
    gcc \
    gdb \
    git \
    glib \
    gnupg \
    go \
    google-chrome \
    netcat \
    nmap \
    node \
    openssl \
    php \
    python \
    p7zip \
    react-native-cli \
    readline \
    ripgrep \
    rsync \
    ruby \
    tmux \
    typescript \
    wget \
    zsh

brew cask install \
    alfred \
    clipy \
    iterm2 \
    keepassxc \
    google-backup-and-sync \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    qlvideo \
    quicklook-csv \
    quicklook-json \
    slack \
    spectacle \
    spotify \
    sublime-text \
    visual-studio-code \
    vlc

# Personal #
brew install \
    youtube-dl

brew cask install \
    calibre \
    discord \
    gimp \
    minecraft \
    steam \
    telegram \
    private-internet-access \
    qbittorrent \
    youtube-to-mp3

# Optional #
brew install \
    angular-cli \
    awscli \
    dropbox \
    heroku \
    hugo \
    packer \
    perl \
    telnet \
    vbindiff \
    weechat

brew cask install \
    aerial \
    darktable \
    docker \
    fastlane \
    firefox \
    github \
    minikube \
    obs \
    postman \
    signal \
    vagrant \
    wireshark \
    xquartz

# TODO: Fonts
# Fonts
cask 'font-lato'
cask 'font-open-sans'
cask 'font-roboto'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'

