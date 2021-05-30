# CentOS Bootstrapping

This assumes a CentOS 8 minimal installation.

- [CentOS Bootstrapping](#centos-bootstrapping)
- [Initial setup](#initial-setup)
- [CentOS 8 to CentOS 8 Stream](#centos-8-to-centos-8-stream)
- [Chrome](#chrome)
- [Gnome tweaks](#gnome-tweaks)
- [Build tools](#build-tools)
- [Tmux](#tmux)
- [Git](#git)
- [Vundle](#vundle)
- [Bash settings](#bash-settings)
- [Fonts](#fonts)
- [openjdk](#openjdk)
- [EPEL](#epel)
- [snap](#snap)
- [sbt](#sbt)
- [Scala](#scala)
- [Python](#python)
- [Go](#go)
- [IntelliJ IDEA](#intellij-idea)
- [PyCharm](#pycharm)
- [VS Code](#vs-code)
- [Discord](#discord)
- [Sublime](#sublime)
- [Spotify](#spotify)
- [Maven](#maven)
- [Spark](#spark)
- [Docker](#docker)
- [GCP](#gcp)
- [AWS](#aws)
- [Terraform](#terraform)
- [Kubernetes](#kubernetes)
- [Tensorflow](#tensorflow)

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
sudo dnf -y install atlas atlas-devel gcc-gfortran openssl-devel libffi-devel
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
sudo tar xzf openjdk-*_linux-x64_bin.tar.gz -C /opt/
rm openjdk-*_linux-x64_bin.tar.gz
sudo ln -s /opt/jdk-* /opt/jdk
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

# Scala
Download Scala from https://www.scala-lang.org/download/scala2.html
```sh
cd ~/*ownloads
sudo tar xzf scala-* -C /opt/
rm scala-*
sudo ln -s /opt/scala-* /opt/scala
```

# Python
```
sudo dnf -y install python39
```

# Go
Download Go from https://golang.org/doc/install.
```
cd ~/*ownloads
sudo tar xf go*.tar.gz -C /opt
sudo ln -s /opt/go* /opt/go
rm go*.tar.gz
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
```sh
sudo snap install discord
```

# Sublime
```sh
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf -y install sublime-text
```

# Spotify
```
sudo snap install spotify
```

# Maven
Download latest from https://maven.apache.org/download.cgi.
```sh
cd ~/*ownloads
sudo tar xf apache-maven-*.tar.gz -C /opt
sudo ln -s /opt/apache-maven* /opt/maven
rm apache-maven-*.tar.gz
```

# Spark
Download Spark from https://spark.apache.org/downloads.html
```sh
cd ~/*ownloads
sudo tar xzf spark-* -C /opt/
rm spark-*
sudo ln -s /opt/spark-* /opt/spark
```

# Docker
```sh
sudo dnf -y remove podman buildah
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl enable containerd
sudo systemctl start docker
```
Non-root docker access
```sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo service docker restart
```

# GCP
```sh
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo dnf -y install google-cloud-sdk
```

# AWS
```sh
cd ~/*ownloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws-*
```

# Terraform
```sh
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf -y install terraform
```

# Kubernetes
```sh
sudo tee -a /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo dnf -y install kubectl
```
kind
```sh
GO111MODULE="on" go get sigs.k8s.io/kind@v0.11.1
```

# Tensorflow
```sh
sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
```
Get download and see instructions from https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=CentOS&target_version=8&target_type=rpm_local. They will look like the below
```sh
sudo rpm --install cuda-repo-*.rpm
rm cuda-repo-*.rpm
sudo dnf clean expire-cache
sudo dnf -y module install nvidia-driver:latest-dkms
sudo dnf -y install cuda
sudo dnf -y install freeglut-devel libX11-devel libXi-devel libXmu-devel make mesa-libGLU-devel
```
There is some other random step that says the below - maybe follow it or not?

    The libcuda.so library is installed in the /usr/lib{,64}/nvidia directory. For pre-existing projects which use libcuda.so, it may be useful to add a symbolic link from libcuda.so in the /usr/lib{,64} directory.

Testing
```sh
cat /proc/driver/nvidia/version
mkdir -p ~/sandbox/
cd ~/sandbox/cuda-examples/
cuda-install-samples-11.3.sh .
cd NVIDIA_CUDA-*_Samples
make
./bin/x86_64/linux/release/deviceQuery
```
cuDNN  
Download `cuDNN` tar from https://developer.nvidia.com/cudnn.
```sh
cd ~/*ownloads
sudo rpm -ivh libcudnn8-8.2.0.53-1.cuda11.3.x86_64.rpm
sudo rpm -ivh libcudnn8-devel-8.2.0.53-1.cuda11.3.x86_64.rpm
sudo rpm -ivh libcudnn8-samples-8.2.0.53-1.cuda11.3.x86_64.rpm
```
Testing cuDNN
```sh
sudo dnf -y install freeimage freeimage-devel
mkdir -p ~/sandbox/cudnn-examples
cd ~/sandbox/cudnn-examples
cp -r /usr/src/cudnn_samples_v8/ .
cd cudnn_samples_v8/mnistCUDNN
make clean && make
./mnistCUDNN
```
Tensorflow
```sh
python3.9 -m virtualenv .venv
. .venv/bin/activate
pip install scipy numpy tensorflow matplotlib jupyter
```