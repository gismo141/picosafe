# Picosafe - an encrypted USB-device 

<p >
  <img align="left" src="https://raw.github.com/gismo141/picosafe/master/user_manual/images/picosafe.jpg" alt="Picosafe" height="380px"/>
  <img align="right" src="https://raw.github.com/gismo141/picosafe/master/user_manual/images/picosafe_pcb.jpg" alt="Picosafe PCB" height="380px"/>
</p>

## What is Picosafe?
Picosafe is an encrypted USB-device running debian-linux on an ARM processor. It is developed by embedded-projects in Augsburg and the Universität der Bundeswehr München. 

## Usage notes:
At the time of writing the project needs to be placed under `/opt/picosafe` (This is a bug and will be fixed later).

Before you can use this project you need to copy the `eldk-5.2.1`-folder (toolchain) to `/opt` using the command:

	mv /opt/picosafe/toolchain/opt/eldk-5.2.1/ /opt/

Afterwards you need to install the programs under `tools` using:

	make
	make install

This installs some aes-related programs that are needed in the subscripts.

To create the SD-Card for the Picosafe call as **root** (not sudo):

1.	Create and Compile **Busybox**
	*	`cd /opt/picosafe/initramfs/busybox/`
	*	`cp ../config_busybox .config` (to reset configuration to standard)
	*	`make menuconfig`
	*	`make`

2.	Create **InitRAMFS**
	*	`./opt/picosafe/initramfs/geninitramfs.sh`

3.	Setup and Compile **Kernel**
	*	`cd /opt/picosafe/kernel/linux-3.3.0-lpc313x/`
	*	`cp ../config-picosafe-3.3 .config` (to reset configuration to standard)
	*	`make menuconfig`
	*	`make`

4.	Create **zImage.crypt**
	*	`./opt/picosafe/kernel/build.sh -k <path_to_keyfile>`

5.	Partition and Fill **SD-Card**
	*	`./opt/picosafe/rootfs/partitionsdcard.sh <sdcard>`
	*	`./opt/picosafe/rootfs/fillsdcard.sh <sdcard> <keyfile> <bootloader> [<pemfile>]`

## Dependencies:

Up to now you need to have at least following programs installed:

- `gcc`
- `linux-headers` (linux-headers-$(uname -r))
- `make`
- `git`
- `parted`
- `realpath`
- `libncurses5-dev`
- `ntfs-3g`
- `cryptsetup`

## How could you contribute?
1. [Fork this project][fork] to your account.
2. [Create a new branch][branch] for the improvements, you intend to make.
3. **Make the changements in your fork.**
4. [Send a pull-request][pr] from your fork’s branch to my `master` branch.
 
You can always use the web-interface to make the changes you want. It helps you automizing the workflow from above.

[fork]: http://help.github.com/forking/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: http://help.github.com/pull-requests/
