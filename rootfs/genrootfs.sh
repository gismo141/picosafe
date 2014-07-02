#!/bin/bash

# usage: ./genrootfs.sh /dev/sdX path/to/picosafe.key [PEM_FILE]
# The first two parameters are needed, the third one is optional. If omitted,
# the PEM_FILE for the webserver will be generated automatically.

KERNELSRC="../kernel/linux-3.3.0-lpc313x/"  # path to kernel sources
SDCARD="$1"
KEYFILE="$2"
BOOTLOADER="$3"
PEMFILE="$4"
PASSWORD="picosafe"
SWAPFILESIZE=64 # in MB
# random string; will be used as name for cryptsetup. In general any string
# would do, but if the name is already used, cryptsetup will fail. This may
# happen if this script is not successful and restarted.
ROOTFS="`tr -dc "[:alpha:]" < /dev/urandom | head -c 8`"

usage() {
    echo "Usage: $0 DEVICE KEYFILE [PEMFILE]"
    echo "    DEVICE:  path to device file of SD-card (e.g. /dev/sdb)"
    echo "    KEYFILE: key for decrypting kernel and initramfs (must match picosafe!)"
    echo "    PEMFILE: pemfile for hiawathi webserver on initramfs"
}

cd "`dirname $0`"

. ../common/common.sh

# check if argument omitted
if [ "$SDCARD" == "" ]; then
  echo "Argument for device missing: $0 DEVICE KEYFILE BOOTLOADER" >&2
  echo
  usage
  exit 1;
fi

if [ "$KEYFILE" == "" ]; then
  echo "Argument for keyfile missing: $0 DEVICE KEYFILE BOOTLOADER" >&2
  echo
  usage
  exit 1;
fi

if [ "$BOOTLOADER" == "" ]; then
  echo "Argument for bootloader missing: $0 DEVICE KEYFILE BOOTLOADER" >&2
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

echo "Filling SD-card with random data..."
#dd if=/dev/urandom of=$SDCARD

SDCARDSIZE=`cat /sys/class/block/$BASENAME/size`
#TEST="expr / 2000 / 2 + 500"
LUKSPARTITIONSIZE=`expr "$SDCARDSIZE"  / 2000 / 2 + 500`
echo -n "Luks partition size: "
echo "$LUKSPARTITIONSIZE MB"

# create partitions
echo "Creating partion layout..."
parted "$SDCARD" -a optimal --script -- mklabel msdos                # create empty partition table
parted "$SDCARD" -a optimal --script -- mkpart primary ext3 2M 50M   # create ext3 partition (49MB)
parted "$SDCARD" -a optimal --script -- mkpart primary ext3 1M 2M    # create boot partition (1MB)
parted "$SDCARD" -a optimal --script -- mkpart primary ext3 50M "$LUKSPARTITIONSIZE"  # create LUKS partition (8000MB)
parted "$SDCARD" -a optimal --script -- mkpart primary ext3 "$LUKSPARTITIONSIZE" "-1" # create data partition (remaining)

# set partition 2 to bootit
sfdisk -q --change-id "$SDCARD" 2 df

# inform the OS of partition table changes
partprobe "$SDCARD"

echo "Sync..."
sync

sleep 10

echo "Creating filesystems..."
echo -e "\text3 on ${SDCARD}1"
mkfs.ext3 -q -L "Picosafe" "$SDCARD"1
echo -e "\tntfs on ${SDCARD}4"
mkntfs -q -f -L "Picosafe public share" "$SDCARD"4

sleep 10

echo "Creating temporary mount point..."
MNTPNT="`mktemp -d`"

echo "Mounting Picosafe public share"
mount "$SDCARD"4 "$MNTPNT"

echo "Copying files to Picosafe public share..."
cp -r ../initramfs/welcome/* "$MNTPNT"
cp ../user_manual/user_manual.pdf "$MNTPNT"

echo "Sync..."
sync

echo "Umounting Picosafe public share..."
umount -l "$MNTPNT"

echo "Formating LUKS container..."
echo "$PASSWORD" | cryptsetup -q luksFormat "${SDCARD}3"
if [ $? != 0 ]; then
  echo "Can't format container." >&2
  exit 1;
fi

echo "Sync..."
sync

sleep 10

echo "Opening LUKS container..."
echo "$PASSWORD" | cryptsetup -q luksOpen "${SDCARD}3" "$ROOTFS"
if [ $? != 0 ]; then
  echo "Can't open container." >&2
  exit 1
fi

echo "Creating ext3 filesystem inside LUKS container..."
mkfs.ext3 -q -b 1024 "/dev/mapper/$ROOTFS"

echo "Mounting ext3 filesystem to $MNTPNT..."
mount "/dev/mapper/$ROOTFS" "$MNTPNT"

echo "Extracting linux filesystem to $MNTPNT..."
#tar xzf picosafe_rootfs.tar.gz -C "$MNTPNT"
cp -a picosafe_rootfs/. "$MNTPNT"

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

echo "Copying kernel..."
mount "${SDCARD}1"  "$MNTPNT"
../kernel/build.sh -k "$KEYFILE" -s "$PEMFILE" -o "$MNTPNT/zImage.crypt"

echo "Copying config..."
cp config "$MNTPNT/.config"

if [ "$BOOTLOADER" == "" ]; then
  echo "Creating apex bootloader..."
  APEXROM="`mktemp`"
  chmod 600 "$BOOTLOADER"
  ../bootloader/build.sh -a bootloader -k "$KEYFILE" -o "$BOOTLOADER"
  RMAPEXROM=1
fi

echo "Copying apex bootloader..."
dd if="$BOOTLOADER" of="${SDCARD}2" oflag=dsync 2>/dev/null

if [ $RMAPEXROM ]; then
  echo "Deleting temporary apex bootloader..."
  rm "$BOOTLOADER"
fi

if [ $RMPEMFILE ]; then
  echo "Deleting pemfile..."
  rm $PEMFILE
fi

echo "Sync..."
sync

echo "Umounting $MNTPNT..."
umount "$MNTPNT"

echo "Deleting temporary mount point..."
rm -r "$MNTPNT"