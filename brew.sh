#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew tap caskroom/cask

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install macvim
brew install grep
brew install openssh
brew install tmux
brew cask install iterm2
brew install ssh-copy-id

# Java things 
brew install jenv
brew cask install java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk/openjdk/adoptopenjdk8
brew cask install adoptopenjdk/openjdk/adoptopenjdk11
brew cask install adoptopenjdk/openjdk/adoptopenjdk12
brew install gradle

brew install scalaenv
brew install apache-spark

# Development
brew install python3
brew install python2
brew install pyenv
brew install pyenv-virtualenv
brew install git
brew install scala

# Development
brew install python3
brew install python2
brew install pyenv
brew install pyenv-virtualenv
brew install git
brew install scala
brew install sbt
brew install elasticsearch
brew install circleci
brew cask install intellij-idea
brew cask install PyCharm
brew cask install DataGrip
brew cask install WebStorm
brew cask install https://raw.githubusercontent.com/rapid7/awsaml/master/brew/cask/awsaml.rb
brew cask install postgres

# Docker 
brew cask install docker
brew cast install docker-toolbox
brew install docker-compose docker-machine xhyve docker-machine-driver-xhyve

# k8s
brew install kubernetes-cli
brew cask install minikube
brew tap markeissler/hyperkit
brew install hyperkit
brew install kops
brew install txn2/tap/kubefwd
brew upgrade kubefwd


# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
#brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install snappy
brew install snzip
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install jq

brew cask install osxfuse
brew install ext4fuse
# Remove outdated versions from the cellar.
brew cleanup
