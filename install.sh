#! /bin/bash

DIR=$PWD

# INSTALLATION
sudo pacman -S archlinux-keyring
sudo pacman -Syu
sudo pacman -S --needed alacritty autotiling chromium clang cmake discord doas dotnet-sdk emacs fish inotify-tools libreoffice light llvm obs-studio onboard pdfjs picom polybar python-adblock python-pip qutebrowser ranger touchegg ueberzug vim

# Create doas config as I would like to use it from now on
echo "permit persist $USER as root" | sudo tee /etc/doas.conf

# Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

# Create my favourite directory and a build directory for programs I don't want to modify
mkdir ~/Code
mkdir ~/Code/Build

# Write
wget http://www.styluslabs.com/download/write-tgz -O ~/Downloads/write-tgz
tar -xvzf ~/Downloads/write-tgz -C ~/Code/Build
doas ln -s ~/Code/Build/Write/Write /bin/write

# ScreanRot (my fork on GuLinux's screenrotator)
git clone https://github.com/coddra/screanRot ~/Code/Build/ScreanRot
~/Code/Build/ScreanRot/install.sh

# Using paru to get additional packages from aur
rsync --mkpath paru/paru.conf ~/.config/paru/paru.conf
paru -S --needed alacritty-themes detect-tablet-mode-git ttf-dejavu-sans-code

# Get stdbuf
pip install stdbuf

# ALLOW LIGHT TO ACCESS BRIGHTNESS
doas chmod o+w /sys/class/backlight/intel_backlight/brightness

# SETTING UP TABLET MODE
doas gpasswd --add coddra input

doas systemctl enable touchegg.service
doas systemctl start touchegg

# CONFIGURATION

# Remove deprecated config file from polybar
rm ~/.config/polybar/config

if [ "$1" = "force" ]; then
    FLAGS="-a"
else
    FLAGS="-au"
fi
# Copy my configuration files
rsync $FLAGS config/ ~/.config/
rsync $FLAGS doom/ ~/.doom.d/

# REMOVE UNNECCESSARY PACKAGES AND FILES
doas pacman -R conky-manager conky firedragon garuda-zsh-config rofi zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh

rm -rf ~/.zshrc ~/.bashrc_garuda ~/.firedragon
