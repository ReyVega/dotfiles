#!/bin/bash

# Beginning of script
echo "Welcome to Arch Linux!"
echo "Initializing installation..."
pacman --noconfirm -S archlinux-keyring
loadkeys la-lain1
timedatectl set-ntp true
fdisk -l
read -p "Enter the drive to partition: " drive
fdisk $drive

# Root partition
read -p "Enter linux filesystem partition: " root_partition
mkfs.ext4 $root_partition
mount $root_partition /mnt

# Boot partition
read -p "Did you create an EFI partition?: [y/n]: " answer_efi
if [[ $answer_efi = y ]]
then
    read -p "Enter EFI partition: " efi_partition
    mkfs.fat -F 32 $efi_partition
    mkdir /mnt/boot
    mount $efi_partition /mnt/boot
fi

# Home partition
read -p "Did you create a Home partition?: [y/n]: " answer_home
if [[ $answer_home = y ]]
then
    read -p "Enter Home partition: " home_partition
    mkfs.ext4 $home_partition
    mkdir /mnt/home
    mount $home_partition /mnt/home
fi

# Swap partition
read -p "Enter swap partition: " swap_partition
mkswap $swap_partition
swapon $swap_partition

# Dual boot windows
read -p "Do you have a Windows partition?: [y/n]: " answer_windows
if [[ $answer_home = y ]]
then
    read -p "Enter Windows EFI partition: " windows
    mkdir /mnt/windows
    mount $windows /mnt/windows
fi

# Install arch os
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Configure Arch Linux
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc
sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=la-latin1" > /etc/vconsole.conf
read -p "Enter hostname: " hostname
echo $hostname > /etc/hostname
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1		    localhost" >> /etc/hosts
echo "127.0.1.1	    $hostname.localdomain       $hostname" >> /etc/hosts
mkinitcpio -P
passwd

# Configure GRUB
pacman --noconfirm -S grub efibootmgr os-prober amd-ucode
printf "\n# Recognizing other operating systems\n" >> /etc/default/grub
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Create user and initialize services
pacman --noconfirm -S arandr autoconf automake bat binutils bison bluez bluez-utils\
                      bottom brightnessctl clang conky discord dnsmasq docker dunst dust edk2-ovmf\
                      exa fakeroot fd feh firefox fish flameshot flex fzf gcc git gnome-keyring go groff gvfs\
                      hyperfine iptables-nft jdk-openjdk jq kitty libtool lightdm lxappearance lxsession m4 make\
                      man-db mariadb mpd mpv ncmpcpp neofetch neovim networkmanager noto-fonts noto-fonts-cjk noto-fonts-emoji npm ntfs-3g\
                      pacman-contrib patch pcmanfm pipewire pipewire-alsa pipewire-jack pipewire-pulse pkgconf playerctl\
                      pulsemixer pyenv python-pip\
                      qemu qtile ripgrep rofi starship sudo texinfo trash-cli ttf-dejavu ttf-inconsolata ttf-liberation udiskie ueberzug ufw\
                      unzip virt-manager vulkan-radeon which wireplumber xclip xdg-user-dirs xdotool xf86-video-amdgpu xf86-video-vesa\
                      xorg-server xorg-xinput xorg-xkill xorg-xprop xorg-xrandr xorg-xset zathura zathura-pdf-poppler zip zoxide

systemctl enable NetworkManager.service
sed -i "s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g" /etc/sudoers
read -p "Enter username: " username
useradd -m $username
passwd $username
usermod -aG wheel,audio,storage,video $username
su $username
cd $HOME
xdg-user-dirs-update

# dotfiles
git clone --bare git@github.com:ReyVega/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f
git --git-dir=$HOME/.dotfiles --work-tree=$HOME push --set-upstream origin main
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config core.bare false
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config core.worktree $HOME
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no

printf "\nDotfiles installed successfully"

