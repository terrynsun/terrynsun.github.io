---
title: Dell XPS 13 2-in-1 (7390)
layout: post
---
My third laptop and third Arch instasll: Late 2019 Dell XPS 13, 2-in-1 (7390).

My first non-Thinkpad laptop, and the hardest laptop to install Arch on so far.
It seems like every other kernel has some issues involved.

I can't find the "beginners guide install guide" on the Arch wiki anymore.

A few big takeaways from my 2019 install:
- `yaourt` is gone! Apparently I'm pretty behind on the times, since yaourt has
  been officially deprecated since 2018. I'm using `yay` now, and also trying to
  avoid AUR packages more than I had previously.

The nice parts:

## Everything Else

The other main things other than the base OS configuration: login, boot manager.

### refind

```
https://github.com/EvanPurkhiser/rEFInd-minimal
```

### lxdm

```
yay -S lxdm-themes
```

## Level 2 Configuration

```
# Brightness control
pacman -S xbacklight xf86-video-intel

# Touchscreen (surprisingly) worked out of the box

# Status bar
pacman -S conky python

pacman -S wget
https://github.com/aruhier/gnome-terminal-colors-solarized

pacman -S feh evince redshift pavucontrol keepassxc python-pip
pacman -S gvim # needed over vim for system clipboard
```

pacman conf: add color and ILoveCandy
```
pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Web Browser

I've started using Firefox (and Tree Style Tab) for my main browser.

```
pacman -S firefox
pacman -S noto-fonts noto-fonts-emoji ttf-dejavu
```

https://wiki.archlinux.org/index.php/Firefox/Tweaks#Enable_touchscreen_gestures:

Add `MOZ_USE_XINPUT2 DEFAULT=1` to `/etc/security/pam_env.conf`.

I installed Chrome too, but it actually doesn't work: it doesn't actually redraw
the screen correctly.

## TODO

* I should seriously consider running i3-gnome instead of plain i3.
* My on-startup scripts are fragile, and probably aren't running correctly.
