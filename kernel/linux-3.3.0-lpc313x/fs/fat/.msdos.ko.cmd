cmd_fs/fat/msdos.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o fs/fat/msdos.ko fs/fat/msdos.o fs/fat/msdos.mod.o
