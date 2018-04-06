################################################################################
#
################################################################################
. ./config.sh

cd $src
rm -rf binutils-2.30
tar -xvf binutils-2.30.tar.xz
rm -rf binutils-build
mkdir -v binutils-build && cd binutils-build

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.30/configure     \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

make -j$(nproc)

make install

make -C ld clean

make -C ld LIB_PATH=/usr/lib:/lib

cp -v ld/ld-new /tools/bin

cd $src && rm -rf binutils-2.30 binutils-build

