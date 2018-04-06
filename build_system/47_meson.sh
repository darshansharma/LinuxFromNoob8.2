################################################################
#
################################################################
. ./config2.sh

cd $src
rm -rf meson-0.44.0
tar -xvf meson-0.44.0.tar.gz 
cd meson-0.44.0

python3 setup.py build

python3 setup.py install

cd $src && rm -rf meson-0.44.0
