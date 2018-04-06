#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf procps-ng-3.3.12
tar -xvf procps-ng-3.3.12.tar.xz
cd procps-ng-3.3.12

./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.12 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd

make -j$(nproc)
make install

mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

cd $src && rm -rf procps-ng-3.3.12

