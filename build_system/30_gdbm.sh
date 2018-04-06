#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf gdbm-1.14.1
tar -xvf gdbm-1.14.1.tar.gz
cd gdbm-1.14.1

./configure --prefix=/usr \
            --disable-static \
            --enable-libgdbm-compat
make -j$(nproc)
make install

cd $src && rm -rf gdbm-1.14.1

