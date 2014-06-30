/* This is a generated file, don't edit */

#define NUM_APPLETS 141

const char applet_names[] ALIGN1 = ""
"[" "\0"
"[[" "\0"
"adjtimex" "\0"
"ash" "\0"
"awk" "\0"
"basename" "\0"
"beep" "\0"
"blockdev" "\0"
"cat" "\0"
"chattr" "\0"
"chgrp" "\0"
"chmod" "\0"
"chown" "\0"
"chroot" "\0"
"cp" "\0"
"cttyhack" "\0"
"dd" "\0"
"depmod" "\0"
"devmem" "\0"
"df" "\0"
"dhcprelay" "\0"
"dmesg" "\0"
"dnsd" "\0"
"du" "\0"
"dumpleases" "\0"
"echo" "\0"
"egrep" "\0"
"env" "\0"
"expand" "\0"
"expr" "\0"
"false" "\0"
"fgrep" "\0"
"free" "\0"
"fsck" "\0"
"fuser" "\0"
"grep" "\0"
"halt" "\0"
"head" "\0"
"httpd" "\0"
"id" "\0"
"ifconfig" "\0"
"ifdown" "\0"
"ifenslave" "\0"
"ifplugd" "\0"
"ifup" "\0"
"inetd" "\0"
"insmod" "\0"
"iostat" "\0"
"ip" "\0"
"ipaddr" "\0"
"iplink" "\0"
"iproute" "\0"
"iprule" "\0"
"iptunnel" "\0"
"kill" "\0"
"killall" "\0"
"killall5" "\0"
"less" "\0"
"ln" "\0"
"losetup" "\0"
"ls" "\0"
"lsattr" "\0"
"lsmod" "\0"
"lsof" "\0"
"lsusb" "\0"
"mkdir" "\0"
"mkdosfs" "\0"
"mkfifo" "\0"
"mkfs.vfat" "\0"
"mknod" "\0"
"mkswap" "\0"
"modinfo" "\0"
"modprobe" "\0"
"mount" "\0"
"mv" "\0"
"nanddump" "\0"
"nandwrite" "\0"
"nc" "\0"
"netstat" "\0"
"nice" "\0"
"nohup" "\0"
"nslookup" "\0"
"pgrep" "\0"
"pidof" "\0"
"ping" "\0"
"ping6" "\0"
"pkill" "\0"
"poweroff" "\0"
"printenv" "\0"
"ps" "\0"
"pstree" "\0"
"pwd" "\0"
"readlink" "\0"
"realpath" "\0"
"reboot" "\0"
"renice" "\0"
"rm" "\0"
"rmdir" "\0"
"rmmod" "\0"
"route" "\0"
"seq" "\0"
"setserial" "\0"
"sh" "\0"
"sleep" "\0"
"strings" "\0"
"stty" "\0"
"swapoff" "\0"
"swapon" "\0"
"switch_root" "\0"
"sync" "\0"
"sysctl" "\0"
"tac" "\0"
"tail" "\0"
"tee" "\0"
"telnet" "\0"
"test" "\0"
"time" "\0"
"timeout" "\0"
"touch" "\0"
"tr" "\0"
"true" "\0"
"tty" "\0"
"tune2fs" "\0"
"ubiattach" "\0"
"ubidetach" "\0"
"ubimkvol" "\0"
"ubirmvol" "\0"
"ubirsvol" "\0"
"ubiupdatevol" "\0"
"udhcpd" "\0"
"umount" "\0"
"uname" "\0"
"unexpand" "\0"
"uniq" "\0"
"usleep" "\0"
"watchdog" "\0"
"wc" "\0"
"wget" "\0"
"whoami" "\0"
"whois" "\0"
"yes" "\0"
;

#ifndef SKIP_applet_main
int (*const applet_main[])(int argc, char **argv) = {
test_main,
test_main,
adjtimex_main,
ash_main,
awk_main,
basename_main,
beep_main,
blockdev_main,
cat_main,
chattr_main,
chgrp_main,
chmod_main,
chown_main,
chroot_main,
cp_main,
cttyhack_main,
dd_main,
modprobe_main,
devmem_main,
df_main,
dhcprelay_main,
dmesg_main,
dnsd_main,
du_main,
dumpleases_main,
echo_main,
grep_main,
env_main,
expand_main,
expr_main,
false_main,
grep_main,
free_main,
fsck_main,
fuser_main,
grep_main,
halt_main,
head_main,
httpd_main,
id_main,
ifconfig_main,
ifupdown_main,
ifenslave_main,
ifplugd_main,
ifupdown_main,
inetd_main,
modprobe_main,
iostat_main,
ip_main,
ipaddr_main,
iplink_main,
iproute_main,
iprule_main,
iptunnel_main,
kill_main,
kill_main,
kill_main,
less_main,
ln_main,
losetup_main,
ls_main,
lsattr_main,
modprobe_main,
lsof_main,
lsusb_main,
mkdir_main,
mkfs_vfat_main,
mkfifo_main,
mkfs_vfat_main,
mknod_main,
mkswap_main,
modinfo_main,
modprobe_main,
mount_main,
mv_main,
nandwrite_main,
nandwrite_main,
nc_main,
netstat_main,
nice_main,
nohup_main,
nslookup_main,
pgrep_main,
pidof_main,
ping_main,
ping6_main,
pgrep_main,
halt_main,
printenv_main,
ps_main,
pstree_main,
pwd_main,
readlink_main,
realpath_main,
halt_main,
renice_main,
rm_main,
rmdir_main,
modprobe_main,
route_main,
seq_main,
setserial_main,
ash_main,
sleep_main,
strings_main,
stty_main,
swap_on_off_main,
swap_on_off_main,
switch_root_main,
sync_main,
sysctl_main,
tac_main,
tail_main,
tee_main,
telnet_main,
test_main,
time_main,
timeout_main,
touch_main,
tr_main,
true_main,
tty_main,
tune2fs_main,
ubi_tools_main,
ubi_tools_main,
ubi_tools_main,
ubi_tools_main,
ubi_tools_main,
ubi_tools_main,
udhcpd_main,
umount_main,
uname_main,
expand_main,
uniq_main,
usleep_main,
watchdog_main,
wc_main,
wget_main,
whoami_main,
whois_main,
yes_main,
};
#endif

const uint16_t applet_nameofs[] ALIGN2 = {
0x0000,
0x0002,
0x0005,
0x000e,
0x0012,
0x0016,
0x001f,
0x0024,
0x002d,
0x0031,
0x0038,
0x003e,
0x0044,
0x004a,
0x0051,
0x0054,
0x005d,
0x0060,
0x0067,
0x006e,
0x0071,
0x007b,
0x0081,
0x0086,
0x0089,
0x0094,
0x0099,
0x009f,
0x00a3,
0x00aa,
0x00af,
0x00b5,
0x00bb,
0x00c0,
0x00c5,
0x00cb,
0x00d0,
0x00d5,
0x00da,
0x00e0,
0x00e3,
0x00ec,
0x00f3,
0x00fd,
0x0105,
0x010a,
0x0110,
0x0117,
0x011e,
0x0121,
0x0128,
0x012f,
0x0137,
0x013e,
0x0147,
0x014c,
0x0154,
0x015d,
0x0162,
0x0165,
0x016d,
0x0170,
0x0177,
0x017d,
0x0182,
0x0188,
0x018e,
0x0196,
0x019d,
0x01a7,
0x01ad,
0x01b4,
0x01bc,
0x01c5,
0x01cb,
0x01ce,
0x01d7,
0x01e1,
0x01e4,
0x01ec,
0x01f1,
0x01f7,
0x0200,
0x0206,
0x020c,
0x0211,
0x0217,
0x021d,
0x0226,
0x022f,
0x0232,
0x0239,
0x023d,
0x0246,
0x024f,
0x0256,
0x025d,
0x0260,
0x0266,
0x026c,
0x0272,
0x0276,
0x0280,
0x0283,
0x0289,
0x0291,
0x0296,
0x029e,
0x02a5,
0x02b1,
0x02b6,
0x02bd,
0x02c1,
0x02c6,
0x02ca,
0x02d1,
0x02d6,
0x02db,
0x02e3,
0x02e9,
0x02ec,
0x02f1,
0x02f5,
0x02fd,
0x0307,
0x0311,
0x031a,
0x0323,
0x032c,
0x0339,
0x0340,
0x0347,
0x034d,
0x0356,
0x035b,
0x0362,
0x036b,
0x036e,
0x0373,
0x037a,
0x0380,
};

const uint8_t applet_install_loc[] ALIGN1 = {
0x33,
0x12,
0x33,
0x23,
0x11,
0x11,
0x41,
0x11,
0x21,
0x12,
0x14,
0x34,
0x13,
0x31,
0x33,
0x11,
0x23,
0x13,
0x32,
0x34,
0x22,
0x32,
0x42,
0x12,
0x11,
0x11,
0x11,
0x31,
0x33,
0x21,
0x11,
0x32,
0x13,
0x32,
0x12,
0x22,
0x12,
0x41,
0x34,
0x11,
0x33,
0x13,
0x11,
0x23,
0x11,
0x13,
0x33,
0x32,
0x11,
0x22,
0x13,
0x11,
0x13,
0x22,
0x12,
0x32,
0x33,
0x33,
0x33,
0x31,
0x31,
0x42,
0x44,
0x44,
0x44,
0x11,
0x33,
0x21,
0x33,
0x33,
0x03,
};

#define MAX_APPLET_NAME_LEN 12
