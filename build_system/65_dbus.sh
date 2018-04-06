#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf dbus-1.12.4
tar -xvf dbus-1.12.4.tar.gz
cd dbus-1.12.4

 ./configure --prefix=/usr                       \
              --sysconfdir=/etc                   \
              --localstatedir=/var                \
              --disable-static                    \
              --disable-doxygen-docs              \
              --disable-xml-docs                  \
              --docdir=/usr/share/doc/dbus-1.12.4 \
              --with-console-auth-dir=/run/console

make -j$(nproc)
make install

mv -v /usr/lib/libdbus-1.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libdbus-1.so) /usr/lib/libdbus-1.so

ln -sfv /etc/machine-id /var/lib/dbus

cd $src && rm -rf dbus-1.12.4

