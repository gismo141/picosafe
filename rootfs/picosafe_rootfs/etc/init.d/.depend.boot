TARGETS = mountkernfs.sh mountdevsubfs.sh bootlogd hostname.sh hwclockfirst.sh hdparm checkroot.sh cryptdisks-early cryptdisks hwclock.sh ifupdown-clean module-init-tools mtab.sh checkfs.sh mountall.sh ifupdown networking urandom procps mountall-bootclean.sh portmap mountnfs.sh mountnfs-bootclean.sh screen-cleanup tmux-cleanup bootmisc.sh lm-sensors stop-bootlogd-single
INTERACTIVE = checkroot.sh cryptdisks-early cryptdisks checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
bootlogd: mountdevsubfs.sh
hostname.sh: bootlogd
hwclockfirst.sh: bootlogd mountdevsubfs.sh
hdparm: bootlogd mountdevsubfs.sh
checkroot.sh: mountdevsubfs.sh hostname.sh hwclockfirst.sh hdparm bootlogd
cryptdisks-early: checkroot.sh
cryptdisks: checkroot.sh cryptdisks-early
hwclock.sh: checkroot.sh bootlogd
ifupdown-clean: checkroot.sh
module-init-tools: checkroot.sh
mtab.sh: checkroot.sh
checkfs.sh: cryptdisks checkroot.sh mtab.sh
mountall.sh: checkfs.sh
ifupdown: ifupdown-clean
networking: mountkernfs.sh mountall.sh ifupdown
urandom: mountall.sh
procps: mountkernfs.sh mountall.sh module-init-tools bootlogd
mountall-bootclean.sh: mountall.sh
portmap: networking ifupdown mountall.sh
mountnfs.sh: mountall.sh networking ifupdown portmap
mountnfs-bootclean.sh: mountall.sh mountnfs.sh
screen-cleanup: mountall.sh mountnfs.sh mountnfs-bootclean.sh
tmux-cleanup: mountall.sh mountnfs.sh mountnfs-bootclean.sh
bootmisc.sh: mountall.sh mountnfs.sh mountnfs-bootclean.sh
lm-sensors: mountall.sh mountnfs.sh mountnfs-bootclean.sh
stop-bootlogd-single: mountall.sh cryptdisks cryptdisks-early checkroot.sh hwclock.sh ifupdown ifupdown-clean networking portmap mountnfs.sh mountnfs-bootclean.sh checkfs.sh urandom mountkernfs.sh hostname.sh mountdevsubfs.sh module-init-tools screen-cleanup hwclockfirst.sh hdparm bootlogd tmux-cleanup mtab.sh procps mountall-bootclean.sh bootmisc.sh lm-sensors
