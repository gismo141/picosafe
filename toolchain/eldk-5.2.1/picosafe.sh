P1=/opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/bin/armv5te-linux-gnueabi/ 
P2=/opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/bin/armv5te-linux-gnueabi/ 

export ARCH=arm 
export CROSS_COMPILE=arm-linux-gnueabi-
export PATH=$P1:$P2:$PATH
