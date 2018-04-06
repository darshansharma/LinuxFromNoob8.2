#####################################################################
#
#####################################################################
. ./config.sh

cd $src
rm -rf perl-5.26.1
tar -xvf perl-5.26.1.tar.xz
cd perl-5.26.1

sh Configure -des -Dprefix=/tools -Dlibs=-lm
make -j$(nproc)

cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.26.1
cp -Rv lib/* /tools/lib/perl5/5.26.1

cd $src && rm -rf perl-5.26.1

