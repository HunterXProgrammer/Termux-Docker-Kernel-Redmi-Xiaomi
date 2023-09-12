#!/data/data/com.termux/files/usr/bin/bash
#
# Compile script for compiling Termux Docker Compatible Kernel for Redmi Note 9/9S/Pro/Pro Max.

apt update
yes | pkg install -y proot-distro which qemu-user-aarch64

distro="ubuntu"
tmpfile="$(mktemp -q)"
dir_name="$(basename "$(pwd)")"

sed 's/DISTRO_ARCH=$DEVICE_CPU_ARCH/DISTRO_ARCH=aarch64/' "$(which proot-distro 2>/dev/null)" | sed 's/\(distribution with alias.*already exists.*\)"/\1\n\n  Proceeding to use already installed distribution\."/g' > "$tmpfile"
bash "$tmpfile" install --override-alias $distro-kernel-builder $distro | grep -Ev "Now run.*to log in"

bash $tmpfile login --isolated --termux-home $distro-kernel-builder -- bash -c "apt update --allow-insecure-repositories 2>/dev/null && apt install --allow-unauthenticated -y curl python2 gcc gcc-arm-linux-gnueabi make zip bc libssl-dev xz-utils diffutils 2>&1 | grep -v -e warning -e WARNING -e Readline -e Dialog && cd \"\$HOME/$dir_name\" && bash build.sh termux"

rm $tmpfile

# zip_name=$(basename $(ls $HOME/$dir_name/out/*\.zip | head -n 1))

# cp $HOME/$dir_name/out/$zip_name /sdcard

ls $HOME/$dir_name/out/*\.zip | head -n 1
