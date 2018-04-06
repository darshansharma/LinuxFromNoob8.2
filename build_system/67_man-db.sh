#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf man-db-2.8.1
tar -xvf man-db-2.8.1.tar.xz
cd man-db-2.8.1

./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.1 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap

make -j$(nproc)
make install

sed -i "s:man man:root root:g" /usr/lib/tmpfiles.d/man-db.conf

cd $src && rm -rf man-db-2.8.1

