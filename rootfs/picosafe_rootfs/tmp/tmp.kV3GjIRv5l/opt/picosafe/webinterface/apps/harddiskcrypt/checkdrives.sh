#!/bin/bash 

while [ 1 ]
do
for FILE in $(find /home/picosafe/drives -name '*.lun*' -exec grep -il 'close' {} \;)
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
sleep 4
done

