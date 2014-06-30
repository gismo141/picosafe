#!/bin/bash

DIRECTORY="/home/picosafe"

# Set rights for gadgetdevices
# XXX
chmod -R 777 /sys/devices/platform/fsl-usb2-udc.0/gadget/

# Remove all device Files
for FILE in $(find "$DIRECTORY/drives" -name '*.lun*' )
do
  rm "$FILE"
done

touch "$DIRECTORY/drives/reserved.lun0"
touch "$DIRECTORY/drives/reserved.lun1"

for FILE in $(find "$DIRECTORY/drives" -name '*.loop*' )
do
  rm "$FILE"
done



case "$1" in
  start)
    while [ 1 ]
    do
      for FILE in $(find "$DIRECTORY/drives" -name '*.lun*' -exec grep -il 'close' {} \;)
      do
        LUN=$(echo "${FILE}" | cut -d'.' -f 2)
        #CONTENT=$(cat /sys/devices/platform/fsl-usb2-udc.0/gadget/"$LUN"/file)
        CONTENT=$(cat $FILE)
        echo "$CONTENT"
        if [ "$CONTENT" != '' ]
        then
          echo Trying to reset "$LUN"
          echo '' > /sys/devices/platform/fsl-usb2-udc.0/gadget/"$LUN"/file
          if [ $? -eq 0 ]
          then
            rm "$FILE"
            echo "$LUN reseted"
          fi
        fi
      done
      sleep 4  #XXX
    done
    ;;
  stop)
    echo "Stopping harddiskcrypt"
    pkill harddiskcrypt #XXX
    ;;
  *)
    echo "Usage: /etc/init.d/harddiskcrypt {start|stop}"
    exit 1
    ;;
esac

exit 0
