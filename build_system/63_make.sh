#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf make-4.2.1
tar -xvjf make-4.2.1.tar.bz2
cd make-4.2.1

./configure --prefix=/usr

make -j$(nproc)
make install

cd $aa

