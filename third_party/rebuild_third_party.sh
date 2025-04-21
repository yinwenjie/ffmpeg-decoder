#! /bin/bash

# FFmpeg
rm -rf ./ffmpeg_output
cd ./FFmpeg
make clean
./configure --enable-shared --enable-static --prefix=../ffmpeg_output --disable-programs --disable-doc \
            --disable-avdevice --disable-swscale --disable-postproc --disable-avfilter --disable-x86asm \
            --disable-network --disable-dwt --disable-lsp --disable-faan --disable-iamf 
make -j8 && make install