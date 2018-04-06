#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf wget-1.19.1
tar -xvf wget-1.19.1.tar.xz
cd wget-1.19.1

./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl &&
make -j$(nproc)

make install

cd $aa

