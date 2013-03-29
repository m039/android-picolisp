#!/bin/sh


OUTPUT_TAR=native-picolisp.tar
PICOLISP_TGZ=data/picoLisp-3.1.1.tgz

ndk-build

TMP=$(mktemp -d)

LIB=$TMP/lib-picolisp
mkdir $LIB

# fill $TMP
cp data/pil $TMP

# fill $TMP/lib-picolisp
cp libs/armeabi/picolisp $LIB
tar -C $LIB -xzf $PICOLISP_TGZ --strip=1  picoLisp/lib picoLisp/lib.l picoLisp/ext.l

tar -C $TMP -cf $OUTPUT_TAR .

rm -rf $TMP
