#####################################################################
#
#####################################################################
. ./config.sh

cd $LFS/source
rm -rf sed-4.4
tar -xvf sed-4.4.tar.xz
cd sed-4.4

./configure --prefix=/tools
make -j$(nproc)
make install

cd $src && rm -rf sed-4.4

