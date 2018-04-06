#############################################################################
#
#############################################################################
. ./config.sh

rm -rf $src
mkdir $src
wget --input-file=wget-list --continue --directory-prefix=$src

mkdir /LFS-source
cp -r $src /LFS-source
