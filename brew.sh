#!/usr/bin/env bash
# TODO: figure out how to include this

# Taps
# TODO: figure out taps and usage
tap 'caskroom/cask'
tap 'caskroom/eid'
tap 'caskroom/fonts'
tap 'caskroom/versions'
tap 'homebrew/bundle'

# Essentials
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
    grep \
    netcat \
    nmap \
    node \
    openssl \
    python \
    react-native-cli \
    readline \
    ripgrep \
    rsync \
    ruby \
    tmux \
    typescript \
    vim \
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

# Personal
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

# Optional
brew install \
    angular-cli \
    awscli \
    dropbox \
    heroku \
    hugo \
    packer \
    perl \
    telnet \
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

