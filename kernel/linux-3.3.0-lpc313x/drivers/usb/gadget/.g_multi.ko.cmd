cmd_drivers/usb/gadget/g_multi.ko := arm-linux-gnueabi-ld -EL -r  -T /opt/picosafe/kernel/linux-3.3.0-lpc313x/scripts/module-common.lds --build-id  -o drivers/usb/gadget/g_multi.ko drivers/usb/gadget/g_multi.o drivers/usb/gadget/g_multi.mod.o