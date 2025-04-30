# My personal dotfiles
This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing
everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free
to explore, learn and copy parts for your own dotfiles.

# A Fresh macOS Setup
These instructions are for when you've already set up your dotfiles. If you want to get started on your own dotfiles you can
[find instructions below](#your-own-dotfiles).

## Backup your data
If you're migrating from an existing Mac, you should first make sure to back up all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?

## Setting up your Mac
After backing up your old Mac, you may now follow these installation instructions to set up a new one.

> **Note:** these installation instructions are tailored to myself. Your requirements may vary, and you should be pulling down [your own dotfiles repository](#your-own-dotfiles).

1. Update macOS to the latest version through system preferences.
2. Set up an SSH key by installing 1Password. Use the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally. Make sure to set the default key used in the terminal to the SSH key set in the GitHub account.
3. Clone this repository to `~/.dotfiles` with:
```bash
git clone --recursive git@github.com/rawilk/dotfiles.git ~/.dotfiles
```
4. Run the installation with:
```bash
cd ~/.dotfiles && ./fresh.sh
```
5. Start `Herd.app` and run its installation process.
6. Restart your computer to finalize the process.

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the reference in the [`.zshrc`](./shell/.zshrc#L2) file.

### Cleaning your old Mac (optional)
After you've set up your new Mac, you may want to wipe it and perform a clean installation on it. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to back up any important data first, though!

### Fresh macOS install
From time-to-time, it may be beneficial to completely re-install macOS on your machine and start over. I typically like to do this for each major release of macOS. After going through the [checklist](#backup-your-data) above, you can follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

## Your Own Dotfiles
**Please note that the instructions below assume you already have set up Oh My Zsh so make sure to first [install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started) before you continue.**

If you want to install your own dotfiles from this setup, it's pretty easy to do so. First you'll need to fork this repo. After that you can tweak it any way you want.

Go through the [`.macos`](./macos/.set-defaults.sh) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

Check out the [`.aliases`](./shell/.aliases) file and add your own aliases. If you need to tweak your `$PATH` check out the [`.zshrc`](./shell/.zshrc) file. More info about how to customize Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).

## Credits
Inspiration for these dotfiles taken from:

- [Dries Vints Dot Files](https://github.com/driesvints/dotfiles)
- [Freek Van der Herten Dot Files](https://github.com/freekmurze/dotfiles)
