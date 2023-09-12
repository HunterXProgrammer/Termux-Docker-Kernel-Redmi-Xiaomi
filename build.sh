#!/usr/bin/env bash

 #
 # Script For Building Termux Docker Compatible Kernel For Redmi 9 Series
 #

##----------------------------------------------------------##
# Specify Kernel Directory
KERNEL_DIR="$(pwd)"

##----------------------------------------------------------##
# Device Name and Model
MODEL=Xiaomi
DEVICE="MiAtoll"

# Kernel Defconfig
DEFCONFIG="vendor/miatoll-perf_defconfig"

# Output Directory
OUT="./out"

# Files
IMAGE="$OUT/arch/arm64/boot/Image.gz"
DTBO="$OUT/arch/arm64/boot/dtbo.img"
DTB="$OUT/arch/arm64/boot/dts/qcom/cust-atoll-ab.dtb"

# Verbose Build
VERBOSE="0"

# Kernel Version
KERVER="$(make kernelversion)"

COMMIT_HEAD="$(git log --oneline -1)"

# Date and Time
DATE="$(TZ=Asia/Kolkata date +"%Y%m%d-%T")"
TIME="$(date +"%F%S")"

# Specify Final Zip Name
ZIPNAME="TermuxDockerCompatible-RedmiKernel"
FINAL_ZIP="${ZIPNAME}-${TIME}.zip"

##----------------------------------------------------------##
# Specify compiler.

if [ -z "$1" ]; then
    COMPILER="proton"
else
    if [ "$1" = "termux" ]; then
        COMPILER="clang+llvm-16.0.6-aarch64-linux-gnu"
    else
        COMPILER="$1"
    fi
fi

##----------------------------------------------------------##
# Specify Linker

LINKER=ld.lld

##----------------------------------------------------------##
# Clone ToolChain
function cloneTC() {

	if [ "$COMPILER" = "atomx" ]; then
	    if [ ! -d "$HOME/$COMPILER" ]; then
            echo " Cloning Atomx Clang ToolChain"
	        git clone --depth=1 https://gitlab.com/ElectroPerf/atom-x-clang "$HOME/$COMPILER"
		fi
	    export PATH="$HOME/$COMPILER/bin:$PATH"

	elif [ "$COMPILER" = "azure" ] && [ ! -d "$HOME/$COMPILER" ]; then
        echo " Cloning Azure Clang ToolChain"
	    git clone --depth=1 https://gitlab.com/Panchajanya1999/azure-clang "$HOME/$COMPILER"
	    export PATH="$HOME/$COMPILER/bin:$PATH"

	elif [ "$COMPILER" = "cosmic" ]; then
	    if [ ! -d "$HOME/$COMPILER" ]; then
	        echo " Cloning Cosmic Clang ToolChain"
	        git clone --depth=1 https://gitlab.com/GhostMaster69-dev/cosmic-clang "$HOME/$COMPILER"
		fi
	    export PATH="$HOME/$COMPILER/bin:$PATH"

	elif [ "$COMPILER" = "proton" ]; then
	    if [ ! -d "$HOME/$COMPILER" ]; then
	        echo " Cloning Proton Clang ToolChain"
	        git clone --depth=1 https://github.com/kdrag0n/proton-clang "$HOME/$COMPILER"
		fi
	    export PATH="$HOME/$COMPILER/bin:$PATH"

	# elif [ "$COMPILER" = "snapdragon" ]; then
	#    if [ ! -d "$HOME/$COMPILER" ]; then
	#        echo " Cloning Snapdragon Clang ToolChain"
	#        git clone --depth=1 https://github.com/ZyCromerZ/SDClang "$HOME/$COMPILER"
	#	 fi
	#	 rm -rf "$HOME/$COMPILER/dtc" &>/dev/null
	#	 if [ ! -d "$HOME/$COMPILER/dtc" ]; then
	#        echo " Cloning Required DTC"
	#        git clone --depth=1 https://github.com/libxzr/dtc-aosp "$HOME/$COMPILER/dtc"
	#		 cd "$HOME/$COMPILER/dtc"
	#		 sed -i 's/-Werror//' Makefile
	#		 NO_PYTHON=1 make
	#	 fi
	#	 mkdir -p "$HOME/$COMPILER/toolchain" &>/dev/null
	#	 if [ ! -d "$HOME/$COMPILER/toolchain/aarch64" ] || [ ! -d "$HOME/$COMPILER/toolchain/arm" ]; then
	#        echo " Cloning Required AOSP Dependencies"
	#        git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 "$HOME/$COMPILER/toolchain/aarch64"
	#		 cd "$HOME/$COMPILER/toolchain/aarch64"
	#		 git reset --hard 74ea98e3cc5a4b49be2df0f070b814fff7ab140b
	#        git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 "$HOME/$COMPILER/toolchain/arm"
	#		 cd "$HOME/$COMPILER/toolchain/arm"
	#	     git reset --hard 16dab5225bf4c95baae3733f05b6e4b0e1c9aae9
	#    fi
	#	
	#    export DTC_EXT=dtc
	#	 export PATH="$HOME/$COMPILER/bin:$PATH"
	#	 export PATH="$HOME/$COMPILER/dtc:$PATH"
	#    export PATH="$HOME/$COMPILER/toolchain/aarch64/bin:$PATH"
	#    export PATH="$HOME/$COMPILER/toolchain/arm/bin:$PATH"

	elif [ "$COMPILER" = "silont" ]; then
	    if [ ! -d "$HOME/$COMPILER" ]; then
	        echo " Cloning SilonT Clang ToolChain"
	        git clone --depth=1 https://github.com/silont-project/silont-clang "$HOME/$COMPILER"
		fi
	    export PATH="$HOME/$COMPILER/bin:$PATH"

	elif [ "$COMPILER" = "aosp" ]; then
        echo " Cloning Aosp Clang 17.0.3 ToolChain"
        mkdir aosp-clang
        cd aosp-clang || exit
	    wget -q https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r498229.tar.gz
        tar -xf clang*
        cd .. || exit
	    git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.git --depth=1 gcc
	    git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.git  --depth=1 gcc32
	    export PATH="${KERNEL_DIR}/aosp-clang/bin:${KERNEL_DIR}/gcc/bin:${KERNEL_DIR}/gcc32/bin:${PATH}"
	elif [ "$COMPILER" = "clang+llvm-16.0.6-aarch64-linux-gnu" ]; then
	    if [ ! -d "$HOME/$COMPILER" ]; then
	        echo " Downloading $COMPILER Toolchain"
	        cd "$(mktemp -q -d)"
	        curl -SL -o "${COMPILER}.tar.xz" "https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/${COMPILER}.tar.xz"
	        tar -xvf ${COMPILER}.tar.xz -C "$HOME"
	        rm "${COMPILER}.tar.xz"
	    fi
	    export PATH="$HOME/$COMPILER/bin:$PATH"
	else
	    echo "Invalid ToolChain Selected"
	    exit 1
    fi
}

##------------------------------------------------------##
# Export Variables
function exports() {

    # Export KBUILD_COMPILER_STRING
    if [ -d "$HOME/$COMPILER" ]; then
        export KBUILD_COMPILER_STRING=$(${HOME}/${COMPILER}/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
    elif [ -d ${KERNEL_DIR}/gcc64 ]; then
        export KBUILD_COMPILER_STRING=$("$KERNEL_DIR/gcc64"/bin/aarch64-elf-gcc --version | head -n 1)
    elif [ -d ${KERNEL_DIR}/aosp-clang ]; then
        export KBUILD_COMPILER_STRING=$(${KERNEL_DIR}/aosp-clang/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
    fi

    # Export ARCH and SUBARCH
    export ARCH=arm64
    export SUBARCH=arm64

    # KBUILD USER and HOST
    export KBUILD_BUILD_USER="TermuxDockerCompatible"
    export KBUILD_BUILD_HOST="RedmiKernel"

    # Clang Triple
    export CLANG_TRIPLE=aarch64-linux-gnu-
	#32bit VDSO
	export CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
	# Compile Options
	if [ "$COMPILER" != "gcc64" ] && [ "$COMPILER" != "aosp-clang" ]; then
	    COMPILE_OPTIONS="CC=clang \
	                     HOSTCC=clang \
	                     HOSTCXX=clang++ \
	                     CROSS_COMPILE=aarch64-linux-gnu- \
	                     CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
	                     LD=${LINKER} \
	                     AR=llvm-ar \
	                     NM=llvm-nm \
	                     OBJCOPY=llvm-objcopy \
	                     OBJDUMP=llvm-objdump \
	                     STRIP=llvm-strip \
	                     READELF=llvm-readelf \
	                     OBJSIZE=llvm-size"
	fi

	export PROCS=$(nproc --all)
}

##----------------------------------------------------------------##
# Compilation
function compile() {
    START=$(date +"%s")

    echo -e "\nKernel Version : $KERVER\nDate : $(TZ=Asia/Kolkata date)\nDevice : $MODEL [$DEVICE]\n Core Count : $PROCS\nCompiler Used : $KBUILD_COMPILER_STRING\n"
	# Compile
	cd "${KERNEL_DIR}"
	rm -rf $OUT &>/dev/null
	mkdir -p $OUT
	make O=$OUT ARCH=arm64 ${DEFCONFIG}
	if [ -d "$HOME/$COMPILER" ] && [ "$COMPILER" != "gcc64" ] && [ "$COMPILER" != "aosp-clang" ]; then
	    make -j$PROCS O=$OUT \
	    ARCH=arm64 $COMPILE_OPTIONS \
	    V=$VERBOSE 2>&1 | tee error.log
	elif [ -d ${KERNEL_DIR}/gcc64 ]; then
	    make -kj$PROCS O=$OUT \
	    ARCH=arm64 \
	    CROSS_COMPILE_ARM32=arm-eabi- \
	    CROSS_COMPILE=aarch64-elf- \
	    LD=aarch64-elf-${LINKER} \
	    AR=llvm-ar \
	    NM=llvm-nm \
	    OBJCOPY=llvm-objcopy \
	    OBJDUMP=llvm-objdump \
	    STRIP=llvm-strip \
	    OBJSIZE=llvm-size \
	    V=$VERBOSE 2>&1 | tee error.log
    elif [ -d ${KERNEL_DIR}/aosp-clang ]; then
        make -kj$PROCS O=$OUT \
	    ARCH=arm64 \
	    CC=clang \
        HOSTCC=clang \
	    HOSTCXX=clang++ \
	    CROSS_COMPILE=aarch64-linux-android- \
	    CROSS_COMPILE_ARM32=arm-linux-androideabi- \
        LD=${LINKER} \
        AR=llvm-ar \
        NM=llvm-nm \
        OBJCOPY=llvm-objcopy \
        OBJDUMP=llvm-objdump \
        STRIP=llvm-strip \
        READELF=llvm-readelf \
        OBJSIZE=llvm-size \
	    V=$VERBOSE 2>&1 | tee error.log
    fi

	# Verify Files
	if ! [ -a "$IMAGE" ]; then
	    echo "Kernel Compilation Failed Due To Errors"
	    exit 1
	else
	    echo " Kernel Compilation Finished. Started Zipping"
	fi
}

##----------------------------------------------------------------##
function zipping() {
	# Copy Files To AnyKernel3 Zip
	cp -rf AnyKernel3 $OUT
	cp $IMAGE $OUT/AnyKernel3
	cp $DTBO $OUT/AnyKernel3
	cp $DTB $OUT/AnyKernel3

	# Zipping and echo Kernel
	cd $OUT/AnyKernel3 || exit 1
    zip -r9 "../${FINAL_ZIP}" ./* -x '*.git*' README.md ./*placeholder
	find .. -not -name "$FINAL_ZIP" -delete &>/dev/null
    MD5CHECK=$(md5sum "../$FINAL_ZIP" | cut -d' ' -f1)
    echo -e "\nBuild took : $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s)\nFor $MODEL ($DEVICE)\n${KBUILD_COMPILER_STRING}\nMD5 Checksum : $MD5CHECK\n"
	echo -e "\nOutput Directory: $OUT\n"
	echo -e "Zipname: ${FINAL_ZIP}\n"
	cd ..
}

##----------------------------------------------------------##

cloneTC
exports
compile
END=$(date +"%s")
DIFF=$(($END - $START))
zipping

##----------------*****-----------------------------##
