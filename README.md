# Description
This **[gist](https://gist.github.com/FreddieOliveira/efe850df7ff3951cb62d74bd770dce27)** made me interested in using Docker natively in Termux, but my phone kernel did not support running Docker.

On most Android phones it's required to have a compatible kernel to run Docker natively in Termux.

Searching around, **[this](https://github.com/ProjectVelvet/kernel_xiaomi_sm6250)** was the only half-working kernel source code repo that compiled after corrections. All other repos were either too outdated kernels or too new for the stock ROM.

This is a Termux Docker compatible kernel for Redmi Note 9S/Pro/Pro Max that I use.

You can build this yourself or use the pre-built AnyKernel3 zip in **[releases](https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/releases)**. Just flash the zip via any kernel flasher app like **[HorizonKernelFlasher](https://github.com/libxzr/HorizonKernelFlasher)** or custom recovery and reboot.

Tested on stock MIUI ROM with Android 11. Should also support Android 12.

<br>

### What Kernel Features Were Missing In Stock?
Check this list for the full comparison - **[COMPARISON.md](https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/blob/redmi-note-9/COMPARISON.md)**

<br>

## 1. Installing/Flashing The Kernel
Download the AnyKernel3 zip from **[releases](https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/releases)** and flash it using any kernel flasher app like **[HorizonKernelFlasher](https://github.com/libxzr/HorizonKernelFlasher)** or custom recovery. Reboot and enjoy.

<br>

> **Important**
> Remember to make a backup of current boot.img and dtbo.img
>
> You can always flash the backup and reboot whenever you mess up.
>
> Simply run this in **Termux** to back them up:-
>
>     su -c 'dd if=/dev/block/bootdevice/by-name/boot of=/data/local/boot.img; dd if=/dev/block/by-name/dtbo of=/data/local/dtbo.img'
> 
> And if you mess up you can restore it using a custom recovery like **OrangeFox** or **TWRP**:-
>
>     dd if=/data/local/boot.img of=/dev/block/bootdevice/by-name/boot; dd if=/data/local/dtbo.img of=/dev/block/by-name/dtbo

<br>

## 2. Completed Flashing The Kernel and Rebooted, Now What?
> **Note**
> As explained **[here](https://gist.github.com/FreddieOliveira/efe850df7ff3951cb62d74bd770dce27/#netnetfilterxt_qtaguidc)**, you'll get a small warning popup. It's harmless so you can ignore it.

<br>

~~Open **Termux** and install **Docker**:-~~ **(Read important note)**

 ~~`yes | pkg upgrade -y && pkg install -y root-repo && pkg install -y docker`~~

<br>

> **Important**
> Currently the **docker** package from Termux is not working due to this bug https://github.com/moby/moby/issues/45935
>
> To fix it, **docker** needs to be compiled with a compatible version of Golang, ie:- **go1.20.5**.
>
> The **[workflow](https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/blob/main/.github/workflows/build_debian_package_docker.yml)** to create the correct debian(`.deb`) package via GitHub Actions using the official **[termux/package-builder](https://hub.docker.com/r/termux/package-builder)** Docker image.
>
> You can install the docker debian package compiled using **go1.20.5** from releases until it's fixed in the official **[termux-packages](https://github.com/termux/termux-packages)** repo.
>
> Open **Termux** and install **Docker** from releases:-
>
>     yes | pkg upgrade -y && pkg install -y root-repo && pkg install -y containerd runc && if [[ "$(uname -m)" =~ .*a.*64.* ]]; then arch=aarch64 ; elif [[ "$(uname -m)" =~ .*arm.* ]]; then arch=arm; elif [[ "$(uname -m)" =~ .*86.*64.* ]]; then arch=x86_64; elif [[ "$(uname -m)" =~ .*86.* ]]; then arch=x86; fi && cd $(mktemp -q -d) && curl -SL -o docker-$arch.deb "https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/releases/download/debian-package-docker/docker-$arch.deb" && dpkg -i docker-$arch.deb

<br>

And then install **tini**:-

    yes | pkg upgrade -y && pkg install -y root-repo && pkg install -y containerd runc && if [[ "$(uname -m)" =~ .*a.*64.* ]]; then arch=aarch64 ; elif [[ "$(uname -m)" =~ .*arm.* ]]; then arch=arm; elif [[ "$(uname -m)" =~ .*86.*64.* ]]; then arch=x86_64; elif [[ "$(uname -m)" =~ .*86.* ]]; then arch=x86; fi && cd $(mktemp -q -d) && curl -SL -o docker-$arch.deb "https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/releases/download/debian-package-tini/tini-$arch.deb" && dpkg -i tini-$arch.deb

<br>

> **Note**
> The package **tini** built via GitHub Actions using this **[workflow](https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi/blob/main/.github/workflows/build_debian_package_tini.yml)**.

    yes | pkg upgrade -y && pkg install -y git make cmake ndk-multilib which termux-elf-cleaner && cd && rm -rf tini &>/dev/null; git clone --depth=1 https://github.com/krallin/tini && cd tini && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX .. && if [[ "$(uname -m)" =~ .*a.*64.* ]]; then ln -nfs $PREFIX/opt/ndk-multilib/aarch64-linux-android/lib/libc.a $PREFIX/lib/libc.a; elif [[ "$(uname -m)" =~ .*arm.* ]]; then ln -nfs $PREFIX/opt/ndk-multilib/arm-linux-android/lib/libc.a $PREFIX/lib/libc.a; elif [[ "$(uname -m)" =~ .*86.*64.* ]]; then ln -nfs $PREFIX/opt/ndk-multilib/x86_64-linux-android/lib/libc.a $PREFIX/lib/libc.a; elif [[ "$(uname -m)" =~ .*86.* ]]; then ln -nfs $PREFIX/opt/ndk-multilib/i686-linux-android/lib/libc.a $PREFIX/lib/libc.a; fi && make -j$(nproc --all) && make install tini-static && termux-elf-cleaner "$(which tini-static)" &>/dev/null && ln -nfs "$(which tini-static)" "$PREFIX/bin/tini" && ln -nfs "$(which tini-static)" "$PREFIX/bin/docker-init"

<br>

# Building
### On Ubuntu and similar Linux distros -

    sudo apt update; cd
    sudo apt install -y git python3 python2 gcc bc libssl-dev make zip
    git clone --depth=1 https://github.com/HunterXProgrammer/Termux-Docker-Kernel-Redmi-Xiaomi
    cd Termux-Docker-Kernel-Redmi-Xiaomi
    bash build.sh
    cd ./out

The output directory is at `./out`.

The compiled kernel/dtbo/dtc is compressed into an AnyKernel3 zip for portability and ease of use via any custom recovery or kernel flasher.

<br>

### Build Using GitHub Actions
Fork the repo, enable GitHub Actions, open the Actions tab and run the workflow. Takes about 20mins to build the kernel and it'll be added to the releases section.

<br>

### Build Using Termux
TODO

<br>

## Disclaimer
You are responsible for what you do with this.






