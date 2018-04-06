################################################################
#
################################################################
. ./config2.sh

cd $src
rm -rf Python-3.6.4
tar -xvf Python-3.6.4.tar.xz
cd Python-3.6.4

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes

make -j$(nproc)

make install
chmod -v 755 /usr/lib/libpython3.6m.so
chmod -v 755 /usr/lib/libpython3.so

cd $src && rm -rf Python-3.6.4
