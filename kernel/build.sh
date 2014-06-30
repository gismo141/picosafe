#!/bin/bash

WORKDIR="`dirname $0`"
WORKDIR="`realpath \"$WORKDIR\"`"

KERNELDIR="linux-3.3.0-lpc313x"
INITRAMFSDIR="../initramfs/"

. "$WORKDIR/../common/common.sh"

usage()
{
  echo "$0 [ -k PICOSAFE_KEY -s PEMFILE -o OUTPUTFILE -h ]"
  echo "  $0 will build a kernel."
  echo ""
  echo "  optional arguments:"
  echo "    -k PICOSAFE_KEY: if submitted, the kernel will be encrypted."
  echo "    -s PEMFILE: key for SSL webserver"
  echo "    -o OUTPUT: output filename; if omitted, the output filename will be zImage or zImage.crypt if encrypted"
  echo "    -h: print this text and exit"
}

while getopts "o:k:s:h" opt; do
  case $opt in
    k)
      if [ ! -r "$OPTARG" ]; then
        echo "file $OPTARG doesn't exist or is not readable" >&2
        exit 1
      fi
      KEYFILE="$OPTARG"
      ;;
    o)
      OUTPUT="$OPTARG"
      ;;
    s)
      if [ ! -r "$OPTARG" ]; then
        echo "file $OPTARG doesn't exist or is not readable" >&2
        exit 1
      fi
      PEMFILE="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    h)
      usage
      exit 0
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

check_root
set_crosscompiler

if [ "$OUTPUT" == "" ]; then
  if [ "$KEYFILE" == "" ]; then
    OUTPUT="zImage"
  else
    OUTPUT="zImage.crypt"
  fi
fi

(
  cd "$WORKDIR/$KERNELDIR"   
  make modules

  cd "$WORKDIR/$INITRAMFSDIR"
  ./geninitramfs.sh $PEMFILE

  cd "$WORKDIR/$KERNELDIR"
  make zImage
)

[ $? != 0 ] && exit 1

if [ "$KEYFILE" != "" ]; then
  picosafe_aes -k "$KEYFILE" -o "$OUTPUT" "$WORKDIR/$KERNELDIR/arch/arm/boot/zImage"
else
  cp "$WORKDIR/$KERNELDIR/arch/arm/boot/zImage" "$OUTPUT"
fi
