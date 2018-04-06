#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf systemd-234-lfs
tar -xvf systemd-234-lfs.tar.xz
cd systemd-234-lfs

cat > config.cache << "EOF"
KILL=/bin/kill
MOUNT_PATH=/bin/mount
UMOUNT_PATH=/bin/umount
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include/blkid"
HAVE_LIBMOUNT=1
MOUNT_LIBS="-lmount"
MOUNT_CFLAGS="-I/tools/include/libmount"
cc_cv_CFLAGS__flto=no
SULOGIN="/sbin/sulogin"
GPERF_LEN_TYPE=size_t
XSLTPROC="/usr/bin/xsltproc"
EOF

./configure --prefix=/usr            \
            --sysconfdir=/etc        \
            --localstatedir=/var     \
            --config-cache           \
            --with-rootprefix=       \
            --with-rootlibdir=/lib   \
            --enable-split-usr       \
            --disable-firstboot      \
            --disable-ldconfig       \
            --disable-sysusers       \
            --without-python         \
            --with-default-dnssec=no \
            --docdir=/usr/share/doc/systemd-234

make -j$(nproc)
make install

rm -rfv /usr/lib/rpm

for tool in runlevel reboot shutdown poweroff halt telinit; do
     ln -sfv ../bin/systemctl /sbin/${tool}
done
ln -sfv ../lib/systemd/systemd /sbin/init

systemd-machine-id-setup

cd $aa

