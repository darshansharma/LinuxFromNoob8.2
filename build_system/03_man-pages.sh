################################################################
#
################################################################
. ./config2.sh

cd $src
rm -rf man-pages-4.15
tar -xvf man-pages-4.15.tar.xz
cd man-pages-4.15

make -j$(nproc) install

cd $src && rm -rf man-pages-4.15
