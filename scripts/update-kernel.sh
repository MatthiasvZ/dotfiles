#!/bin/sh

MAKEOPTS="-j$(nproc)"

# Check if we're running Gentoo
if [ ! -f '/etc/gentoo-release' ]; then
    echo "this script only works on gentoo"
    exit 1;
fi

# Cd into the kernelsrc directory
cd /usr/src/linux

# Check whether the config file exists
if [ ! -f '.config' ]; then
	echo ".config not found"
	exit 1;
fi

# Update the config file
make olddefconfig $MAKEOPTS

# Compile the kernel
KCFLAGS="-falign-functions=32 -pipe" make $MAKEOPTS

# Install into /boot and /lib/modules
make modules_install $MAKEOPTS
make install $MAKEOPTS
genkernel initramfs --luks --lvm --microcode=intel --microcode-initramfs --no-splash --compress-initramfs --compress-initramfs-type=zstd --makeopts="$MAKEOPTS"

# Reinstall modules (nvidia...)
emerge -q1 @module-rebuild

# Update GRUB
grub-mkconfig -o /boot/grub/grub.cfg
