#!/usr/bin/bash

# Initial setup
sudo dnf -y groupinstall "Server with GUI"
systemctl set-default graphical.target
sudo systemctl enable NetworkManager

# Centos 8 -> Centos 8 Stream
sudo dnf -y swap centos-linux-repos centos-stream-repos
sudo dnf -y distro-sync

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y localinstall google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm

# Gnome tweaks
sudo dnf -y install gnome-tweaks gnome-shell-extension-no-hot-corner
# remember to
#   disable top-left hot corner
#   make caps lock map to ctrl
#   enable bottom task bar

# Build tools
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install autoconf automake pkg-config gcc gcc-c++ libevent-devel ncurses-devel

# Tmux
cd /opt
sudo git clone https://github.com/tmux/tmux.git
cd tmux
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install

# Git
ssh-keygen -t ed25519 -C "ssingal05@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# from vim run
#     :PluginInstall

# Bash settings
cd
git clone git@github.com:ssingal05/.bashrc_libs.git
echo "\n. ~/.bashrc_libs/bashrc" >> ~/.bashrc
ln -s ~/.bashrc_libs/vimrc .vimrc
ln -s ~/.bashrc_libs/tmux.conf .tmux.conf

# Fonts
cd ~/*ownloads
git clone git@github.com:powerline/fonts.git
sudo mkdir -p /usr/share/fonts/sourcecodepro
sudo cp fonts/SourceCodePro/* /usr/share/fonts/SourceCodePro/
fc-cache -f /usr/share/fonts/
# Change the font via terminal settings

# openjdk
# download from https://jdk.java.net/16/
sudo mv openjdk-*_linux-x64_bin.tar.gz /opt/
cd /opt
sudo tar xf openjdk-*_linux-x64_bin.tar.gz
sudo rm openjdk-*_linux-x64_bin.tar.gz
sudo ln -s jdk-* jdk

# epel
sudo dnf install epel-release
sudo dnf upgrade

# snap
sudo dnf -y install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# sbt
sudo rm -f /etc/yum.repos.d/bintray-rpm.repo
curl -L https://www.scala-sbt.org/sbt-rpm.repo > sbt-rpm.repo
sudo mv sbt-rpm.repo /etc/yum.repos.d/
sudo dnf -y install sbt

# intellij

# pycharm

# visual studio

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf -y install sublime-text

# spotify
sudo snap install spotify
