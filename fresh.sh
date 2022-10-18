#!/bin/bash

echo 'Setting up your Mac...'

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo 'Install oh-my-zsh'
  echo '-----------------'

  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Symlink zsh preferences
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Symlink vim prefs
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/shell/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $HOME/.dotfiles/shell/.vim $HOME/.vim

# Symlink the Mackup config
ln -s $HOME/.dotfiles/macos/.mackup.cfg $HOME/.mackup.cfg

# Fix missing font characters (see https://github.com/robbyrussell/oh-my-zsh/issues/1906)
cd ~/.oh-my-zsh/themes/
git checkout d6a36b1 agnoster.zsh-theme

# Activate z
cd ~/.dotfiles/shell
chmod +x z.sh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo 'Install homebrew'
  echo '----------------'

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $HOME/.dotfiles/Brewfile

# Setup dev environment
$HOME/.dotfiles/dev.sh

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
echo 'Things to do to make the agnoster terminal theme work:'
echo '1. Set the font in iTerm to Source Code Pro for Powerline'
echo '2. Install patched solarized theme included in ~/.dotfiles/misc'

echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Set some sensible os x defaults by running: $HOME/.dotfiles/macos/set-defaults.sh'
echo '2. Install software not available through Homebrew/App Store:'
echo '--- PS Remote Play'
echo '--- Yubico Authenticator'
echo '--- YubiKey Manager'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'