#####################################################################
#
#####################################################################
. ./config.sh

cd $src
rm -rf gawk-4.2.0
tar -xvf gawk-4.2.0.tar.xz 
cd gawk-4.2.0

./configure --prefix=/tools
make -j$(nproc)
make install

cd $src && rm -rf gawk-4.2.0

