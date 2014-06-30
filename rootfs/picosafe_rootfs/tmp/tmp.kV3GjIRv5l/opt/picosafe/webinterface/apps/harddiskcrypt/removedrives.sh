#!/bin/bash

for FILE in $(find /home/picosafe/drives -name '*.lun*' )
do
	rm "$FILE"
done

for FILE in $(find /home/picosafe/drives -name '*.loop*' )
do
  rm "$FILE"
done
