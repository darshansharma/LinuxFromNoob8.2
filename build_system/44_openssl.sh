#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf openssl-1.1.0g
tar -xvf openssl-1.1.0g.tar.gz
cd openssl-1.1.0g

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic &&
make -j$(nproc)

make MANSUFFIX=ssl install           &&
mv -v /usr/share/doc/openssl{,-1.1.0g} &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.0g

cd $src && rm -rf openssl-1.1.0g

