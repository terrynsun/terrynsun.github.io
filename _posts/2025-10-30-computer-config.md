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

## Installation

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

[Gnome terminal Solarized colors](https://github.com/aruhier/gnome-terminal-colors-solarized)

### Dotfiles

```
# Setup ssh
git clone https://github.com/terrynsun/dotfiles
cd dotfiles
./init.sh

chsh # /usr/bin/zsh
```

### Login

`/etc/lxdm/lxdm.conf`

```
[base]
session=/usr/bin/i3

[display]
theme=IndustrialArch

[userlist]
disable=1
```

## Configuration

### Enable [touchscreen gestures in Firefox](ff)

[ff]:https://wiki.archlinux.org/index.php/Firefox/Tweaks#Enable_touchscreen_gestures:

Add `MOZ_USE_XINPUT2 DEFAULT=1` to `/etc/security/pam_env.conf`.

### Bluetooth

```
yay bluez bluez-util pulseaudio-bluetooth blueman
sudo systemctl enable bluetooth
```

# Ubuntu

```
sudo apt install i3 git zsh tmux polybar

git clone https://github.com/terrynsun/dotfiles.git
cd dotfiles
./init.sh

chsh # /usr/bin/zsh
```

Log out, log into i3.

## i3-mate

I started using i3 alongside mate desktop, which gets you a bit of built-in
niceties and configuration, but allows using i3 as the window manager.

```
sudo apt install ubuntu-mate-desktop
gsettings set com.solus-project.brisk-menu hot-key ''
gsettings set org.mate.session.required-components windowmanager i3
gsettings set org.mate.session.required-components filemanager ''

gsettings set org.mate.session.required-components panel ''
```

## Other packages

```
# vim compiled with +clipboard, to share vim and x clipboards
sudo apt install vim-gtk3
# But I mainly use neovim, anyway.
sudo snap install nvim

sudo apt install \
   ssh curl feh ripgrep autorandr keepassxc \
   gh \
   maim \  # sshot
   xclip \ # sshot, nvim global clipboard

# Bundled with mate (?)
sudo apt install pulseaudio autorandr blueman picom
```

## Docker

See [install docs](https://docs.docker.com/engine/install/ubuntu/) and
[postinstall](https://docs.docker.com/engine/install/linux-postinstall/).
