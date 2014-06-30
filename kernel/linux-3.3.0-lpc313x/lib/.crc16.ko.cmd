cmd_lib/crc16.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o lib/crc16.ko lib/crc16.o lib/crc16.mod.o
