#!/bin/bash

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Install zsh
echo 'Install oh-my-zsh'
echo '-----------------'
rm -rf $HOME/.oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Symlink zsh preferences
rm $HOME/.zshrc
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

# Homebrew
echo 'Install homebrew'
echo '----------------'

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    sudo rm -rf /usr/local/Cellar /usr/local/.git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install Homebrew recipes
brew update

echo 'Install wget'
echo '------------'
brew install wget --overwrite

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo 'Install imagick'
echo '---------------'
pecl install imagick

echo 'Install memcached'
echo '-----------------'
pecl install memcached

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install phpunit-watcher'
echo '-----------------------'
composer global require spatie/phpunit-watcher

echo 'Install laravel global installer'
echo '--------------------------------'
composer global require laravel/installer

echo 'Install laravel valet'
echo '---------------------'
composer global require laravel/valet
valet install

# Create dev directories and clone git repos
./clone.sh

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
echo 'Things to do to make the agnoster terminal theme work:'
echo '1. Install menlo patched font included in ~/.dotfiles/misc https://gist.github.com/qrush/1595572/raw/Menlo-Powerline.otf'
echo '2. Install patched solarized theme included in ~/.dotfiles/misc'

echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Set some sensible os x defaults by running: $HOME/.dotfiles/macos/set-defaults.sh'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'