#!/bin/bash

# terminal
TERM_BASE="/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "[='=]")"
dconf write $TERM_BASE/default-size-columns 84
dconf write $TERM_BASE/use-system-font false
dconf write $TERM_BASE/font "'DejaVu Sans Mono 12'"
dconf write $TERM_BASE/audible-bell false
dconf write $TERM_BASE/scrollbar-policy "'never'"
dconf write $TERM_BASE/use-theme-colors false
dconf write $TERM_BASE/foreground-color "'#ABB2BF'"
dconf write $TERM_BASE/background-color "'#282C34'"
dconf write $TERM_BASE/bold-color "'#ABB2BF'"
dconf write $TERM_BASE/palette "['rgb(92,99,112)', 'rgb(224,108,117)', 'rgb(152,195,121)', 'rgb(209,154,102)', 'rgb(97,175,239)', 'rgb(198,120,221)', 'rgb(86,182,194)', 'rgb(171,178,191)', 'rgb(92,99,112)', 'rgb(224,108,117)', 'rgb(152,195,121)', 'rgb(209,154,102)', 'rgb(97,175,239)', 'rgb(198,120,221)', 'rgb(86,182,194)', 'rgb(171,178,191)']"

# tweaks
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/Endless-shapes.jpg'"
dconf write /org/gnome/shell/enabled-extensions "['launch-new-instance@gnome-shell-extensions.gcampax.github.com']"
dconf write /org/gnome/desktop/input-sources/xkb-options "['lv3:ralt_switch', 'caps:escape']"
dconf write /org/gnome/desktop/interface/enable-hot-corners false
