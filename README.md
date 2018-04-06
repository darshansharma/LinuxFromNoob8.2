# Linux From Noob

Linux From Noob is a source based linux distribution based on linux from scratch. You build the OS with a set of bash scripts, and it creates a bootable iso file that you can install to your computer.
![image](https://github.com/ChrisSaturn/LinuxFromNoob/blob/master/screenshots/Screenshot_2018-02-04_03-42-25.png)

### Facebook Group

https://www.facebook.com/groups/nooblinux/

website comming soon, project under active development. READ TODO list in photo.

### GPL-V3   not responsible for loss of data, machine damage, or anything else. no warrenty. you know how it goes

### Getting Started

It is suggested to use arch linux, you can aquire all the needed dependencies with this command:

pacman -S base-devel linux-headers xorriso bc cpio gzip wget

### 1: Build LFS tools

instructions to build the tools needed to build the OS is pretty straight forward. Change into the build tools directory and run build_tools script or run them individualy.

cd 01_build_tools

./build_tools.sh

### 2: Copying Scripts

you can copy the scripts needed to build the system now.

./copyscripts.sh

### 3: Chroot into the tools environment created earier

./chroot

### 4: Build the Base System

Now it is time to build the base system for our linux OS. Run the build all script or run them individualy like before.

cd 02_build_system

./build_system.sh

### Important Set password to login, auto login comming soon
type:

passwd

When done press CTR-D or type exit to leave chroot

### 5: Preparing to Build the iso File

./prepare-iso.sh

### 6: Creating the iso file

./generate-iso.sh

### 7: Creating a bootable usb 

Its time to create a bootable usb with the newly generated iso file, there are many ways to do this like with programs like unetbootin, and others. I use the command dd, it is more risky because if you dont point to the usb connected to your computer it could wipe your OS or other important data. To create a bootable usb with the command dd, it will look like this, just replace the "of=/dev/sdx" with the name your computer gives your usb device when plugged in.

dd if=linuxfromnoob.iso of=/dev/sdx status=progress

### 8: Reboot and boot from usb

done

### Acknowledgments

linux from scratch 
and 
minimal linux live

### Lead developer Chris Saturn


