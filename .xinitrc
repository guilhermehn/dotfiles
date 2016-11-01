#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources && xrdb -merge -I$HOME ~/.xres/urxvt

# GTK style for QT applications
export QT_QPA_PLATFORMTHEME='gtk2'

# Latvian keyboard layout with diacritics under apostrophe key
setxkbmap -layout lv -variant apostrophe -option ctrl:nocaps

# Disable mouse acceleration
xset m 0 0

# Hide mouse cursor after not using it for 5s
unclutter &

# Start WM
exec i3
