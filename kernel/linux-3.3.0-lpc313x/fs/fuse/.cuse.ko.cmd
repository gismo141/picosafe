cmd_fs/fuse/cuse.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o fs/fuse/cuse.ko fs/fuse/cuse.o fs/fuse/cuse.mod.o
