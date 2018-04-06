######################################################
#
######################################################

export aa=$(pwd)
export LFS=/mnt/lfs
export tools=$aa/01_build_tools
export src=$LFS/source
export iso=$aa/isoimage
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export LC_ALL=POSIX

mkdir -v $LFS
mkdir -v $src
mkdir -v $LFS/tools
ln -sv $LFS/tools /

export PATH=/tools/bin:/bin:/usr/bin:$PATH

