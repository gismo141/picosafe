#!/bin/bash
update-rc.d lighttpd defaults
apt-get install php5-cgi
lighty-enable-mod fastcgi 
lighty-enable-mod fastcgi-php 
apt-get install openssl 
lighty-enable-mod ssl 
openssl req -new -x509 -keyout /etc/lighttpd/server.pem -out server.pem -days 365 -nodes 

apt-get install udhcpd

#start DHCP Server

cat > dhcpd_default << EOF
# Comment the following line to enable
DHCPD_ENABLED="yes"

# Options to pass to busybox' udhcpd.
#
# -S    Log to syslog
# -f    run in foreground

DHCPD_OPTS="-S"
EOF
cat dhcpd_default > /etc/udhcpd.conf

#configure DHCP Server

cat > dhcpd_file << EOF

start 		10.0.0.100
end             10.0.0.200


# The interface that udhcpd will use

interface       usb0            
EOF
cat dhcpd_file > /etc/udhcpd.conf

echo "picosafe" > /etc/hostname
echo "" > /etc/motd


#copy webcontent to /var/www

#lua server kopieren + eintragen in /etc/init.d/rcS
cp ../lua/server.lua /usr/local/bin/server.lua

#/etc/rc.local

if [ -e /ramzswap_setup.sh ]
then
        /ramzswap_setup.sh 2>/ramzswap_setup_log.txt && rm /ramzswap_setup.sh
fi
/setup.sh 2>/setup_log.txt && rm /setup.sh
swapon /swapfile
echo none > /sys/class/leds/picosafe::blue/trigger
echo 1 > /sys/class/leds/picosafe::blue/brightness
/usr/local/bin/server.lua &
chmod -R 777 /sys/devices/platform/fsl-usb2-udc.0/gadget/lun0/file


#/etc/init.d/halt anpassen
#         log_action_msg "Will now halt"
#        echo 0 > /sys/class/leds/picosafe\:\:blue/brightness
#        echo 0 > /sys/class/gpio/gpio11/value
#        halt -d -f $netdown $poweroff $hddown


#lighttpd/conf-available/15-fastcgi-php.conf -> PHP_FCGI_CHILDREN auf 1

/home/picosafe/fred-gui2/apps/harddiskcrypt/removedrives.sh
/home/picosafe/fred-gui2/apps/harddiskcrypt/checkdrives.sh
