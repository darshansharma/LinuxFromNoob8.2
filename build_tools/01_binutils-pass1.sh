################################################################################
#
################################################################################
. ./config.sh

cd $src
rm -rf binutils-2.30
tar -xvf binutils-2.30.tar.xz
rm -rf binutils-build
mkdir -v binutils-build && cd binutils-build

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

../binutils-2.30/configure --prefix=/tools            \
             --with-sysroot=$LFS                      \
             --with-lib-path=/tools/lib               \
             --target=$LFS_TGT                        \
             --disable-nls                            \
             --disable-werror
make -j$(nproc)
make install

cd $src && rm -rf binutils-2.30 binutils-build
