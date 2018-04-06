#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf file-5.32
tar -xvf file-5.32.tar.gz
cd file-5.32

./configure --prefix=/usr
make -j$(nproc)
make install

cd $src && rm -rf file-5.32

