#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf vim80
tar -xvjf vim-8.0.586.tar.bz2
cd vim80

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

sed -i '/call/{s/split/xsplit/;s/303/492/}' src/testdir/test_recover.vim

./configure --prefix=/usr --with-zlib

make -j$(nproc)
make install

ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim80/doc /usr/share/doc/vim-8.0.586

cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

set nocompatible
set backspace=2
set mouse=r
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif


" End /etc/vimrc
EOF

touch ~/.vimrc


cd $src && rm -rf vim80

