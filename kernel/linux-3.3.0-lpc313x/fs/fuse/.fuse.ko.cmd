cmd_fs/fuse/fuse.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o fs/fuse/fuse.ko fs/fuse/fuse.o fs/fuse/fuse.mod.o
