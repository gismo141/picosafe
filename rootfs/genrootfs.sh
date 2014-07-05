#!/bin/bash

KERNELSRC="../kernel/linux-3.3.0-lpc313x/"  # path to kernel sources
SDCARD="$1"
PEMFILE="$2"
PASSWORD="picosafe"
SWAPFILESIZE=64 # in MB
# random string; will be used as name for cryptsetup. In general any string
# would do, but if the name is already used, cryptsetup will fail. This may
# happen if this script is not successful and restarted.
ROOTFS="`tr -dc "[:alpha:]" < /dev/urandom | head -c 8`"

# 2014-06-30: added usage-line for bootloader-argument, by Michael Riedel
usage() {
    echo "Usage: $0 DEVICE [PEMFILE]"
    echo "    DEVICE:     path to device file of SD-card (e.g. /dev/sdb)"
    echo "    PEMFILE:    pemfile for hiawathi webserver on initramfs"
}

cd "`dirname $0`"

. ../common/common.sh

# check if argument omitted
if [ "$SDCARD" == "" ]; then
  echo "Argument for device missing: $0 DEVICE [PEMFILE]" >&2
  echo
  usage
  exit 1;
fi

# set environment for crosscompiler and check, if we're root
set_crosscompiler
check_root

# check if blockdevice
if [ ! -b "$SDCARD" ]; then
  echo "$SDCARD is not a blockdevice." >&2
  exit 1
else
  # check if it blockdevice is removable
  BASENAME="`basename $SDCARD`"

  if [ "`cat /sys/class/block/$BASENAME/removable`" != 1 ]; then
    echo "$SDCARD is not a removable blockdevice."
    exit 1
  fi
fi

# umount partitions
umount "$SDCARD" 2>/dev/null
for dev in "$SDCARD"*; do
  umount $dev 2>/dev/null
done

echo "Opening LUKS container..."
echo "$PASSWORD" | cryptsetup -q luksOpen "${SDCARD}3" "$ROOTFS"
if [ $? != 0 ]; then
  echo "Can't open container." >&2
  exit 1
fi

echo "Mounting ext3 filesystem to $MNTPNT..."
mount "/dev/mapper/$ROOTFS" "$MNTPNT"
wget https://www.dropbox.com/s/9olqt0t7eo7mzi9/picosafe_rootfs.tar.gz
echo "Extracting linux filesystem to $MNTPNT..."
tar xzf picosafe_rootfs.tar.gz -C "$MNTPNT"
rm -rf picosafe_rootfs.tar.gz

echo "Installing kernel modules..."
export INSTALL_MOD_PATH="$MNTPNT"
( cd "$KERNELSRC" && make modules && make modules_install)

echo -e "Creating swap file..."
dd if=/dev/zero "of=$MNTPNT/swapfile" bs=1M "count=$SWAPFILESIZE" 2>/dev/null

echo "Deleting private data..."
echo -e "\t.svn/ directories"
find "$MNTPNT" -name .svn -type d -exec rm -rf {} \;
echo -e "\t~/.viminfo, ~/.bash_history, ~/.ssh, ~/.subversion"
for dir in $MNTPNT/root $MNTPNT/home/*; do
  > "$dir/.viminfo"
  > "$dir/.bash_history"
  rm -r "$dir/.ssh" "$dir/.subversion" 2> /dev/null
done
echo -e "\t/etc/lighttpd/*.pem"
rm $dir/etc/lighttpd/*.pem 2>/dev/null

echo "Copying files..."
echo -e "\t/etc/sudoers"
cp files/sudoers "$MNTPNT/etc/sudoers"
chmod 440 "$MNTPNT/etc/sudoers"
chown 0:0 "$MNTPNT/etc/sudoers"
echo -e "\t/etc/motd"
rm -rf "$MNTPNT/etc/motd"
cp files/motd "$MNTPNT/etc/motd"
chmod 644 "$MNTPNT/var/run/motd"
chown 0:0 "$MNTPNT/var/run/motd"
echo -e "\t/etc/rc.local"
cp files/rc.local $MNTPNT/etc/rc.local
chmod 755 "$MNTPNT/etc/rc.local"
chown 0:0 "$MNTPNT/etc/rc.local"

if [ "$PEMFILE" == "" ]; then
  echo "Generating PEM file..."
  PEMFILE="`mktemp`"
  RMPEMFILE=1
  createpem "$PEMFILE"
fi

echo "Copying pem file..."
cp "$PEMFILE" "$MNTPNT/etc/lighttpd/ssl.pem"

echo "Umounting ext3 filesystem..."
umount "$MNTPNT"

echo "Closing luks container..."
cryptsetup luksClose "$ROOTFS"

echo "Sync..."
sync

echo "Umounting $MNTPNT..."
umount "$MNTPNT"

echo "Deleting temporary mount point..."
rm -r "$MNTPNT"