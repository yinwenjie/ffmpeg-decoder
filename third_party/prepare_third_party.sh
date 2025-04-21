#! /bin/bash

# FFmpeg
rm -rf ./FFmpeg
git clone git@github.com:yinwenjie/FFmpeg.git
cd FFmpeg
./configure --enable-shared --enable-static --prefix=./output --disable-programs --disable-doc \
            --disable-avdevice --disable-swscale --disable-postproc --disable-avfilter --disable-x86asm \
            --disable-network --disable-dwt --disable-lsp --disable-faan --disable-iamf 
make -j8 && make install