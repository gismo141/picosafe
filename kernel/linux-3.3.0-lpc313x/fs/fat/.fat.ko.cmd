cmd_fs/fat/fat.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o fs/fat/fat.ko fs/fat/fat.o fs/fat/fat.mod.o
