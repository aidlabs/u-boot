#!/bin/sh
make -j 4 CROSS_COMPILE=arm-dey-linux-gnueabi- CC="arm-dey-linux-gnueabi-gcc --sysroot=/home/simon/toolchain/digi/ccimx6ulstarter" V=1 HOSTCC="gcc -Wl,-O1" KCFLAGS=-fgnu89-inline distclean ccimx6ulstarter_defconfig all
