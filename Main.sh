#!/bin/bash
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/arch-release]="pacman -Sy"
# Haven't used these yet so not including them...
# osInfo[/etc/centos-release]="yum install -y"
# osInfo[/etc/fedora-release]="dnf install -y"

# Find package manager by distro name
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

# Install the following packages
package="git zsh most curl python3 python-pipx cargo vscode"
${package_manager} ${package} -y

# Install rust based packages
cargo_package="exa"
cargo install ${cargo_package}

# After classic packages are installed, get ZSH specific addons
# OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Clean up unused packages
if [ -d "/etc/debian_version" ]
then
	apt autoremove
else if [ -d "/etc/arch-release" ]
then
	pacman -Rns $(pacman -Qdtq)
fi
