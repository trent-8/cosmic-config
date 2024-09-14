#!/bin/sh
set -x
# install all my pacman packages
sudo pacman -Syu --noconfirm --needed\
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
    mesa\
    nano\
    nano-syntax-highlighting\
    neofetch\
    noto-fonts\
    ntfs-3g\
    obs-studio\
    papirus-icon-theme\
    pamixer\
    power-profiles-daemon\
    rclone\
    rsync\
    scp\
    signal-desktop\
    system76-power\
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

# Function to present a menu and prompt for user input
present_menu() {
    echo "Please select the Vulkan package you want to install:"
    echo "1. vulkan-nvidia (for NVIDIA GPUs)"
    echo "2. vulkan-radeon (for AMD GPUs)"
    echo "3. vulkan-intel (for Intel GPUs)"
    echo "4. vulkan-nouveau (for Nouveau GPUs)"
    echo "5. Exit"
}

# Function to install the selected Vulkan package
install_package() {
    case $1 in
        1)
            echo "Installing vulkan-nvidia..."
            sudo pacman -S --noconfirm --needed vulkan-nvidia
            ;;
        2)
            echo "Installing vulkan-radeon..."
            sudo pacman -S --noconfirm --needed vulkan-radeon
            ;;
        3)
            echo "Installing vulkan-intel..."
            sudo pacman -S --noconfirm --needed vulkan-intel
            ;;
        4)
            echo "Installing vulkan-nouveau..."
            sudo pacman -S --noconfirm --needed vulkan-nouveau
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid selection. Please choose a number between 1 and 5."
            ;;
    esac
}

# Present the menu and get user selection
present_menu
read -p "Enter your choice (1-5): " choice

# Install the selected package
install_package $choice