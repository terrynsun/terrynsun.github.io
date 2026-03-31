---
title: "Computer Configuration"
layout: post
---

My current laptop is a (Late 2019) Dell XPS 13, 2-in-1 (7390).

- [rEFInd](https://github.com/EvanPurkhiser/rEFInd-minimal) as a boot manager
- [LXDM](https://wiki.archlinux.org/title/LXDM) as a login manager
- [i3](https://i3wm.org/) as a window manager, with
 [polybar](https://polybar.github.io/) in place of i3statusbar
- [autorandr](https://github.com/phillipberndt/autorandr) to manage external
    monitors

My dotfiles are [here].

[here]: https://github.com/terrynsun/dotfiles

## Arch Installation

```
pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```
pacman -S i3-wm i3lock
pacman -S python python-pip
pacman -S firefox neovim gnome-terminal

# LXDM config below
pacman -S lxdm
systemctl enable lxdm

# Backlight control
pacman -S xbacklight xf86-video-intel

# Status bar
pacman -S polybar autorandr arandr playerctl

pacman -S feh evince \
    redshift pavucontrol keepassxc \
    maim ripgrep imagemagick

# Printing
yay cups cups-pdf
systemctl enable cups
```

## Ubuntu Installation

### Boot disk

1. Download ubuntu iso: https://ubuntu.com/download/desktop
2. `dd if=iso of=/dev/--- bs=4M`

### Basic updates

```
sudo apt update
sudo apt upgrade
sudo apt autoremove
```

Standard first slate:

```
sudo apt install git zsh tmux polybar
git clone https://github.com/terrynsun/dotfiles.git
cd dotfiles
./init.sh

# vim compiled with +clipboard, to share vim and x clipboards
sudo apt install vim-gtk3
snap install --classic nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

vim +PlugInstall

chsh # /usr/bin/zsh
```

Setup mate-i3.

```
sudo apt install i3 ubuntu-mate-desktop
gsettings set com.solus-project.brisk-menu hot-key ''
gsettings set org.mate.session.required-components windowmanager i3
gsettings set org.mate.session.required-components filemanager ''

gsettings set org.mate.session.required-components panel ''
```

Log out, log back into MATE (i3) and zsh.

Neovim on snap is more up to date than Ubuntu repo.

```
sudo apt install \
   ssh curl ripgrep arandr autorandr \
   keepassxc feh maim \
   pulseaudio pavucontrol playerctl evince xbacklight \
   gh

# These seem to come pre-installed.
sudo apt install blueman picom redshift
```

Remove/disable the builtin MATE status bar so system tray icons will register to
polybar, then restart to clear MATE. Not sure if you need to remove this
library.

Also, have to customize the color scheme to use a light color for icons so they
will show up against the polybar background, and configure blueman to use an
icon that reads color scheme.

For nm-applet without MATE, I used lxappearance to set the icon theme.

```
apt purge ayatana-indicator-common
gsettings set org.blueman.general symbolic-status-icons true
```

VS Code:

```
snap install --classic code
# in vs code terminal
ext install vscodevim.vim
# Set "keyboard.dispatch": "keyCode" for capslock -> esc
ext install matklad.rust-analyzer
# (make sure to also download the server)
```

## Other

- Configure git username, ssh key.

### Login / LXDM

`/etc/lxdm/lxdm.conf`

```
[base]
session=/usr/bin/i3

[display]
theme=IndustrialArch

[userlist]
disable=1
```

### Firefox

Enable [touchscreen gestures in Firefox](ff):
Add `MOZ_USE_XINPUT2 DEFAULT=1` to `/etc/security/pam_env.conf`.

[ff]:https://wiki.archlinux.org/index.php/Firefox/Tweaks#Enable_touchscreen_gestures:

Plugins:
- [Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

### Bluetooth

```
yay bluez bluez-util pulseaudio-bluetooth blueman
sudo systemctl enable bluetooth
```

### Docker

See [install docs](https://docs.docker.com/engine/install/ubuntu/) and
[postinstall](https://docs.docker.com/engine/install/linux-postinstall/).
