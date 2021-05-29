# CentOS Bootstrapping

This assumes a CentOS 8 minimal installation.

# Initial setup
```sh
sudo dnf -y groupinstall "Server with GUI"
systemctl set-default graphical.target
sudo systemctl enable NetworkManager
```

# CentOS 8 to CentOS 8 Stream
```sh
sudo dnf -y swap centos-linux-repos centos-stream-repos
sudo dnf -y distro-sync
```

# Chrome
```sh
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf -y localinstall google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
```

# Gnome tweaks
```sh
sudo dnf -y install gnome-tweaks gnome-shell-extension-no-hot-corner
```
Remember to
* disable top-left hot corner
* make caps lock map to ctrl
* enable bottom task ba

# Build tools
```sh
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install autoconf automake pkg-config gcc gcc-c++ libevent-devel ncurses-devel
```

# Tmux
Initial download:
```sh
sudo git clone https://github.com/tmux/tmux.git /opt
```

Build
```sh
cd /opt/tmux
sudo git pull upstream master
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
```

# Git
```sh
ssh-keygen -t ed25519 -C "ssingal05@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
And then add `~/.ssh/id_ed25519` to your GitHub SSH keys.

# Vundle
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
From Vim, run
```
:PluginInstall
```

# Bash settings
```sh
cd
git clone git@github.com:ssingal05/.bashrc_libs.git
echo "\n. ~/.bashrc_libs/bashrc" >> ~/.bashrc
ln -s ~/.bashrc_libs/vimrc .vimrc
ln -s ~/.bashrc_libs/tmux.conf .tmux.conf
```

# Fonts
```sh
cd ~/*ownloads
git clone git@github.com:powerline/fonts.git
sudo mkdir -p /usr/share/fonts/sourcecodepro
sudo cp fonts/SourceCodePro/* /usr/share/fonts/SourceCodePro/
fc-cache -f /usr/share/fonts/
```
And then change the font to `Source Code Pro for Powerline Regular` terminal settings

# openjdk
Download from https://jdk.java.net/16/
```sh
cd ~/*ownloads
sudo mv openjdk-*_linux-x64_bin.tar.gz /opt/
cd /opt
sudo tar xf openjdk-*_linux-x64_bin.tar.gz
sudo rm openjdk-*_linux-x64_bin.tar.gz
sudo ln -s jdk-* jdk
```

# EPEL
```sh
sudo dnf install epel-release
sudo dnf upgrade
```

# snap
```sh
sudo dnf -y install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap # Maybe not needed?
```

# sbt
```sh
sudo rm -f /etc/yum.repos.d/bintray-rpm.repo
curl -L https://www.scala-sbt.org/sbt-rpm.repo > sbt-rpm.repo
sudo mv sbt-rpm.repo /etc/yum.repos.d/
sudo dnf -y install sbt
```
# Python
```
sudo dnf -y install python39
```

# IntelliJ IDEA
```sh
sudo snap install intellij-idea-community --classic
```

# PyCharm
```sh
sudo snap install pycharm-community --classic
```

# VS Code
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo bash -c "cat > /etc/yum.repos.d/vscode.repo" <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf check-update
sudo dnf upgrade
sudo dnf -y install code
```

# Discord
```
sudo snap install discord
```

# Sublime
```
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf -y install sublime-text
```

# Spotify
```
sudo snap install spotify
```

# Maven
**TODO**

# Spark
**TODO**

# GCP
**TODO**

# AWS
**TODO**

# Terraform
**TODO**

# Kubernetes
**TODO**

# Tensorflow
**TODO**
