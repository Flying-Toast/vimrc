#!/bin/bash

cd gnome &> /dev/null

# arch-update extension
rm -rf arch-update &> /dev/null
git clone https://github.com/RaphaelRochet/arch-update &> /dev/null
cd arch-update
LATEST_TAG=$(git describe --tags)
cd ..
curl -L -o ext.zip "https://github.com/RaphaelRochet/arch-update/releases/download/$LATEST_TAG/arch-update@RaphaelRochet.zip"
mkdir -p ~/.local/share/gnome-shell/extensions
rm -r ~/.local/share/gnome-shell/extensions/arch-update@RaphaelRochet
unzip -q ext.zip -d ~/.local/share/gnome-shell/extensions/arch-update@RaphaelRochet
# arch-update settings
dconf write /org/gnome/shell/extensions/arch-update/always-visible false

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
dconf write $TERM_BASE/palette "['rgb(92,99,112)', 'rgb(224,108,117)', 'rgb(152,195,121)', 'rgb(209,154,102)', 'rgb(97,175,239)', 'rgb(198,120,221)', 'rgb(86,182,194)', 'rgb(171,178,191)', 'rgb(92,99,112)', 'rgb(224,108,117)', 'rgb(152,195,121)', 'rgb(209,154,102)', 'rgb(97,175,239)', 'rgb(198,120,221)', 'rgb(86,182,194)', 'rgb(171,178,191)']"

# tweaks
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/Endless-shapes.jpg'"
dconf write /org/gnome/shell/enabled-extensions "['launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'arch-update@RaphaelRochet']"
dconf write /org/gnome/desktop/input-sources/xkb-options "['lv3:ralt_switch', 'caps:escape']"
dconf write /org/gnome/desktop/interface/enable-hot-corners false

# gnome settings
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///usr/share/backgrounds/gnome/Endless-shapes.jpg'"
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Contacts.desktop', 'org.gnome.Documents.desktop', 'org.gnome.Epiphany.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'org.gnome.Photos.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Characters.desktop']"
dconf write /org/gnome/desktop/privacy/remember-recent-files false
dconf write /org/gnome/desktop/privacy/recent-files-max-age 1
dconf write /org/gnome/settings-daemon/plugins/media-keys/home "['<Super>e']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['<Shift><Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['<Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "@as []"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Alt>Tab']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/window-screenshot-clip "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/area-screenshot-clip "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/screenshot-clip "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/window-screenshot "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/area-screenshot "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/screenshot "@as []"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Primary><Alt>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# files
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'standard'"
