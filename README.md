# My personal dotfiles
This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing
everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free
to explore, learn and copy parts for your own dotfiles.

## A Fresh macOS Setup
These instructions are for when you've already set up your dotfiles. If you want to get started on your own dotfiles you can
[find instructions below](#your-own-dotfiles).

### Before you re-install
First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.
- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly
After going through our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

## Setting up your Mac
If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line tools by running `xcode-select --install`
4. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:
```bash
curl https://raw.githubusercontent.com/rawilk/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```
3. Clone this repo to `~/.dotfiles` with:
```bash
git clone git@github.com:rawilk/dotfiles.git ~/.dotfiles
```
4. Run the installation with:
```bash
~/.dotfiles/fresh.sh
```
5. After mackup is synced with your local storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the reference in the [`.zshrc`](./shell/.zshrc#L2) file.

Your Mac is now ready to use!

### All install commands

```bash
curl https://raw.githubusercontent.com/rawilk/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
git clone git@github.com:rawilk/dotfiles.git ~/.dotfiles
~/.dotfiles/fresh.sh
~/.dotfiles/macos/set-defaults.sh
```

![screenshot](https://github.com/rawilk/dotfiles/blob/master/docs/screenshot.png)

## Signing Commits - Optional
It's generally a good idea to sign your git commits with a gpg key. [This article](https://withblue.ink/2020/05/17/how-and-why-to-sign-git-commits.html) explains why you would want to do this in more detail. To do this, you will need to [generate a new gpg key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key) and tell GitHub about it.

### Generate a GPG key pair
Your key must use RSA.
```bash
gpg --full-generate-key
```

- At the prompt, specify the kind of key you want - press `Enter` to accept the default
- At the prompt, specify the key size you want - press `Enter` to accept the default. Your key must be at least `4096` bits.
- Enter the length of time the key should be valid. Press `Enter` to specify the default selection, indicating that the key doesn't expire.
- Enter your user ID information
  - Ensure you are using the verified email address for your GitHub account.
- Type a secure passphrase

### Find your new key
```bash
gpg --list-secret-keys --keyid-format=long
```

From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:
```bash
gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

### Copy the key
Paste the command below, substituting the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:
```bash
gpg --armor --export 3AA5C34371567BD2
# Prints the GPG key ID, in ASCII armor format
```

Now you can add the key to your GitHub account.

### Sign your commits
Using the same key ID from the example above, enter the following command:
```bash
git config --global user.signingkey 3AA5C34371567BD2
```

To auto-sign all commits, enter the following command:
```bash
git config --global commit.gpgSign true
```

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