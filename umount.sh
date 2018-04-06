#####################################################################
#
#####################################################################
. ./config.sh


umount -v --bind /dev $LFS/dev
umount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
umount -vt proc proc $LFS/proc
umount -vt sysfs sysfs $LFS/sys
umount -vt tmpfs tmpfs $LFS/run


