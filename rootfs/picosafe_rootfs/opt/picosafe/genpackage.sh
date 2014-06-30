#!/bin/bash

. /opt/eldk-5.2.1/picosafe.sh

DIR=`mktemp -d`
DEBIAN="$DIR/DEBIAN"

(
cd sbin
make
)

cp -r DEBIAN $DIR

echo mkdir -p "$DIR/opt/picosafe" "$DIR/opt/picosafe/sbin"
mkdir -p "$DIR/opt/picosafe" "$DIR/opt/picosafe/sbin"
cp -r webinterface "$DIR/opt/picosafe"
cp sbin/picosafe_lun    "$DIR/opt/picosafe/sbin"
cp sbin/picosafed       "$DIR/opt/picosafe/sbin"
cp lua/harddiskcrypt.sh "$DIR/opt/picosafe/sbin"
for dir in `find "$DIR" -name .svn -type d`; do 
  rm -fr $dir; 
done

chmod +x $DIR/opt/picosafe/sbin/*

find $DIR -type f -exec md5sum {} \;>> $DEBIAN/md5sums

echo "$DIR"
dpkg-deb -b $DIR picosafe.deb

rm -r "$DIR"
