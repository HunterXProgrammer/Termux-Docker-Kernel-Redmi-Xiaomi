#!/data/data/com.termux/files/usr/bin/bash
#
# Compile script for compiling Termux Docker Compatible Kernel for Redmi Note 9/9S/Pro/Pro Max.

apt update
yes | pkg install -y proot-distro

distro="ubuntu"
dir_name="$(basename "$(pwd)")"

proot-distro install --override-alias $distro-kernel-builder $distro | grep -Ev "Now run.*to log in"

proot-distro login --isolated --termux-home $distro-kernel-builder -- bash -c "apt update && apt install -y curl python2 gcc gcc-arm-linux-gnueabi make zip bc libssl-dev xz-utils diffutils 2>&1 | grep -v -e warning -e WARNING -e Readline -e Dialog && cd \"\$HOME/$dir_name\" && bash build.sh termux"

# zip_name=$(basename $(ls $HOME/$dir_name/out/*\.zip | head -n 1))

# cp $HOME/$dir_name/out/$zip_name /sdcard

ls $HOME/$dir_name/out/*\.zip | head -n 1
