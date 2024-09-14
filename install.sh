#!/bin/sh
set -x
# install all my pacman packages
sudo pacman -S --noconfirm --needed\
    alacritty\
    bluez\
    bluez-obex\
    brightnessctl\
    cosmic\
    feh\
    firefox\
    git\
    gnome-disk-utility\
    htop\
    inkscape\
    less\
    nano\
    nano-syntax-highlighting\
    neofetch\
    noto-fonts\
    ntfs-3g\
    obs-studio\
    rclone\
    ttf-nerd-fonts-symbols-mono\
    ttf-roboto\
    tumbler\
    unzip\
    vlc\
    wget\
    zip\
    zsh\
    zsh-autosuggestions\
    zsh-history-substring-search\
    zsh-syntax-highlighting

# install yay and packages
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm --needed
yay -S --noconfirm --needed\
    visual-studio-code-bin\
    usbimager

# add all config files
mkdir -p\
    ~/Downloads\
    ~/Pictures
sudo cp ~/cosmic-config/zsh/zshrc /etc/zsh/
sudo cp ~/cosmic-config/nano/nanorc /etc/
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
sudo systemctl enable cosmic-greeter
sudo systemctl enable bluetooth
reboot
