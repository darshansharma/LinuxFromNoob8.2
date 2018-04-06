#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf acl-2.2.52
tar -xvf acl-2.2.52.src.tar.gz
cd acl-2.2.52
sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test
sed -i 's/{(/\\{(/' test/run
sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
    libacl/__acl_to_any_text.c

./configure --prefix=/usr    \
            --disable-static \
            --libexecdir=/usr/lib

make -j$(nproc)

make install install-dev install-lib
chmod -v 755 /usr/lib/libacl.so

mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

cd $src && rm -rf acl-2.2.52

