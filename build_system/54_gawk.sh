#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf gawk-4.2.0
tar -xvf gawk-4.2.0.tar.xz
cd gawk-4.2.0

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make -j$(nproc)
make install

cd $src && rm -rf gawk-4.2.0

