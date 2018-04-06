#####################################################################
#
#####################################################################
. ./config.sh

cd $src
rm -rf xz-5.2.3
tar -xvf xz-5.2.3.tar.xz
cd xz-5.2.3

./configure --prefix=/tools
make -j$(nproc)
make install

cd $src && rm -rf xz-5.2.3

