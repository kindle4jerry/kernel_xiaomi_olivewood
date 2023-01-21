#!/usr/bin/env bash

#git clone https://github.com/kindle4jerry/clang-r416183b1.git
#git clone https://github.com/kindle4jerry/aarch64-linux-android-4.9-bakup.git
#从我git把这俩下下来然后添加到PATH里
PATH=$PATH:~/clang-r416183b1/bin
PATH=$PATH:~/aarch64-linux-android-4.9-bakup/bin


ARCH=arm64;
CC=clang;
CLANG_TRIPLE=aarch64-linux-gnu-;
CROSS_COMPILE=aarch64-linux-gnu-;
CROSS_COMPILE_COMPAT=arm-linux-gnueabi-;
THREAD=$(nproc --all);
DEFCONFIG_NAME=mi439-perf_defconfig
OUT="../out";
#成品在$OUT/arch/arm64/boot/

mkdir $OUT

make CC=$CC ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE CROSS_COMPILE_COMPAT=$CROSS_COMPILE_COMPAT O=$OUT -j$THREAD $DEFCONFIG_NAME;
make CC=$CC ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE CROSS_COMPILE_COMPAT=$CROSS_COMPILE_COMPAT CLANG_TRIPLE=$CLANG_TRIPLE O=$OUT -j$THREAD;





#clean
#make mrproper -j$THREAD;
#make clean -j$THREAD;
#rm -rf $OUT;
