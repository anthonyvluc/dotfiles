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
brew install gnu-sed
# Install Bash 4.
# brew install bash
# brew install bash-completion2

# Install more recent versions of some macOS tools.
brew install vim
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
    mas \
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
    google-drive-file-stream \
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
    virtualbox \
    visual-studio-code \
    vlc

# Personal #
brew install \
    youtube-dl

brew cask install \
    adobe-creative-cloud \
    adobe-acrobat-reader \
    aerial \
    calibre \
    dash \
    discord \
    gimp \
    messenger \
    minecraft \
    steam \
    telegram \
    private-internet-access \
    qbittorrent \
    vnc-viewer \
    youtube-to-mp3

# Optional #
brew install \
    angular-cli \
    awscli \
    dropbox \
    grip \
    heroku \
    hugo \
    packer \
    perl \
    telnet \
    vbindiff \
    weechat

brew cask install \
    aerial \
    epubquicklook \
    darktable \
    docker \
    fastlane \
    firefox \
    github \
    keybase \
    kitematic \
    massreplaceit \
    minikube \
    nightowl \
    obs \
    oracle-jdk \
    parallels \
    pennywise \
    postman \
    signal \
    spotspot \
    vagrant \
    wireshark \
    xquartz \
    yakyak

# TODO: Fonts
# Fonts #
cask 'font-lato'
cask 'font-open-sans'
cask 'font-roboto'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'

# Remove outdated versions from the cellar.
brew cleanup

# Mac App Store #
# Be sure to have mas installed
mas install 1278508951 # Trello
mas install 1176895641 # Spark
