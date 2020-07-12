# My personal dotfiles
This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing
everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free
to explore, learn and copy parts for your own dotfiles.

## Setting up your Mac
Follow these instructions to set up a new Mac.

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add them to Github
3. Clone this repo to `~/.dotfiles` - see script below to clone and install
4. Run `bootstrap` to start the installation
5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

Your Mac is now ready to use!

```bash
git clone git@github.com:rawilk/dotfiles.git .dotfiles
cd .dotfiles
./bootstrap
```