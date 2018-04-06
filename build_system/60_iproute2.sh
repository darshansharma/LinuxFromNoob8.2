#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf iproute2-4.15.0
tar -xvf iproute2-4.15.0.tar.xz
cd iproute2-4.15.0

sed -i /ARPD/d Makefile
sed -i 's/arpd.8//' man/man8/Makefile
rm -v doc/arpd.sgml

sed -i 's/m_ipt.o//' tc/Makefile

make -j$(nproc)
make install

cd $src && rm -rf iproute2-4.15.0

