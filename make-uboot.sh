#!/bin/sh

image_filename="u-boot.imx"


if [ ! -f include/autoconf.mk ]; then 
	make -j 4 CROSS_COMPILE=arm-dey-linux-gnueabi- CC="arm-dey-linux-gnueabi-gcc --sysroot=/home/simon/toolchain/digi/ccimx6ulstarter" V=1 HOSTCC="gcc -Wl,-O1" KCFLAGS=-fgnu89-inline O=../build_ccimx6ulstarter_defconfig distclean ccimx6ulstarter_defconfig
fi

if [ "$1" = "" ]; then
	make -j 4 CROSS_COMPILE=arm-dey-linux-gnueabi- CC="arm-dey-linux-gnueabi-gcc --sysroot=/home/simon/toolchain/digi/ccimx6ulstarter" V=1 HOSTCC="gcc -Wl,-O1" KCFLAGS=-fgnu89-inline O=../build_ccimx6ulstarter_defconfig all
else
    #ARCH=arm make arm=ARM CROSS_COMPILE=arm-linux-gnueabihf- $1 $2 $3
	make -j 4 CROSS_COMPILE=arm-dey-linux-gnueabi- CC="arm-dey-linux-gnueabi-gcc --sysroot=/home/simon/toolchain/digi/ccimx6ulstarter" V=1 HOSTCC="gcc -Wl,-O1" KCFLAGS=-fgnu89-inline O=../build_ccimx6ulstarter_defconfig $1 $2 $3
fi

if [ -f $image_filename ]; then
	echo "copy from $image_filename to /tftpboot/$target_filename"
	sudo cp  $image_filename /tftpboot/$target_filename
	sudo chmod 777 /tftpboot/$target_filename
fi
