# Windows dotfiles setup
This branch of my dotfiles helps automate the setup of a new Windows machine using PowerShell and custom configuration files-designed to mirror the functionality of [my macOS dotfiles](https://github.com/rawilk/dotfiles).

I typically don't do a lot of development on Windows, so this version of my dotfiles is not as comprehensive as my Mac version is. My Windows machines are mostly set up to be used more for gaming than anything else.

> 💡 This setup is intended for fresh Windows installations.

# A Fresh Windows Setup
These instructions are for when you've already set up your dotfiles. If you want to get started on your own dotfiles, you can
[find instructions below](#your-own-dotfiles).

## Backup your data
If you're migrating from an existing PC, you should first make sure to back up all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-cloud directories?
- Did you save all of your work from apps which aren't synced through cloud services?
- Did you remember to export important data from your local database?

## Setting up your PC
After backing up your old PC, you may now follow these installation instructions to set up a new one.

> **Note:** these installation instructions are tailored to myself. Your requirements may vary, and you should be pulling down [your own dotfiles repository](#your-own-dotfiles).

> ⚠️ Run all terminal commands from a PowerShell terminal with administrator privileges.

1. Update Windows to the latest version through system preferences.
2. Set up an SSH key by installing 1Password. Use the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally. Make sure to set the default key used in the terminal to the SSH key set in the GitHub account.
3. Clone this branch to `~/.dotfiles` with:
```powershell
git clone --recursive --branch windows https://github.com/rawilk/dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
```
4. Run the installation with:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\fresh.ps1
```
5. Start `Laravel Herd` and run its installation process.
6. Restart your computer to finalize the process.

Your PC is now ready to use!

## Cleaning your old PC (optional)
After you've set up your new PC, you may want to wipe the old one and perform a clean installation on it. Follow [this article](https://www.microsoft.com/en-us/windowsinsider/cleaninstall) to do that. Remember to back up any important data first, though!

# Your Own Dotfiles
If you want to install your own dotfiles from this setup, it's pretty straightforward to do so. First, you'll need to fork this repo. After that you can tweak it any way you want.

# Credits
Inspiration for these dotfiles taken from:

- [Dries Vints Dot Files](https://github.com/driesvints/dotfiles)
- [Freek Van der Herten Dot Files](https://github.com/freekmurze/dotfiles)
