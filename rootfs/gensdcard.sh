#!/bin/bash

SDCARD="$1"
PASSWORD="picosafe"
SWAPFILESIZE=64 # in MB
# random string; will be used as name for cryptsetup. In general any string
# would do, but if the name is already used, cryptsetup will fail. This may
# happen if this script is not successful and restarted.
ROOTFS="`tr -dc "[:alpha:]" < /dev/urandom | head -c 8`"
EXTOPTIONS="-q -j -m 1 -O dir_index,filetype,sparse_super"


usage() {
  echo "Usage: $0 DEVICE KEYFILE [PEMFILE]"
  echo "    DEVICE:     path to device file of SD-card (e.g. /dev/sdb)"
  exit 1;
}

# check if argument omitted
if [ "$SDCARD" == "" ]; then
  echo "Argument for device missing: $0 DEVICE KEYFILE BOOTLOADER" >&2
  echo usage
fi

# set environment for crosscompiler and check, if we're root
cd "`dirname $0`"
. ../common/common.sh
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

#echo "Filling SD-card with random data..."
#dd if=/dev/urandom of=$SDCARD

SDCARDSIZE=`cat /sys/class/block/$BASENAME/size`
LUKSPARTITIONSIZE=`expr "$SDCARDSIZE"  / 2000 / 2 + 500`
echo -n "Luks partition size: $LUKSPARTITIONSIZE MB"

# create partitions
echo "Creating partition layout..."
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
sleep 5

echo "Creating filesystems..."
echo -e "\text3 on ${SDCARD}1"
mkfs.ext3 $EXTOPTIONS -L "Picosafe" "$SDCARD"1
echo -e "\tFAT32 on ${SDCARD}4"
mkfs.vfat -F 32 -n "PublicShare" "$SDCARD"4

echo "Formating LUKS container..."
echo "$PASSWORD" | cryptsetup -q luksFormat "${SDCARD}3"
if [ $? != 0 ]; then
  echo "Can't format container." >&2
  exit 1;
fi

echo "Opening LUKS container..."
echo "$PASSWORD" | cryptsetup -q luksOpen "${SDCARD}3" "$ROOTFS"
if [ $? != 0 ]; then
  echo "Can't open container." >&2
  exit 1
fi

echo "Creating ext3 filesystem inside LUKS container..."
mkfs.ext3 $EXTOPTIONS "/dev/mapper/$ROOTFS"

echo "Sync..."
sync
sleep 5

echo "Closing luks container..."
cryptsetup luksClose "$ROOTFS"

echo "Sync..."
sync
