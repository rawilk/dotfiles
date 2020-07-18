# My personal dotfiles
This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing
everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free
to explore, learn and copy parts for your own dotfiles.

## Setting up your Mac
Follow these instructions to set up a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line tools by running `xcode-select --install`
4. [Generate a new public and private SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add them to Github
5. Clone this repo to `~/.dotfiles` - see script below to clone and install
6. Run `.fresh.sh` to start the installation
7. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
8. Restart your computer to finalize the process

Your Mac is now ready to use!

```bash
git clone git@github.com:rawilk/dotfiles.git .dotfiles
cd .dotfiles
./fresh.sh
```

![screenshot](https://github.com/rawilk/dotfiles/blob/master/docs/screenshot.png)

## Credits
Inspiration for these dotfiles taken from:

- [Dries Vints Dot Files](https://github.com/driesvints/dotfiles)
- [Freek Van der Herten Dot Files](https://github.com/freekmurze/dotfiles)