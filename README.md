# Picosafe - an encrypted USB-device 

This is a fork of [embedded-projects][] repository.

[embedded-projects]: https://github.com/embeddedprojects/picosafe_stick

## What is picosafe?
Picosafe is an encrypted USB-device running debian-linux on an arm processor. It is developed by embedded-projects in Augsburg, Germany and uses open-source software. 

## Usage notes:
At the time of writing the project needs to be placed under `/opt/picosafe` (This is a bug and will be fixed later).

Before you can use this project you need to copy the `eldk-5.2.1`-folder to `/opt` using the command:

`mv /opt/picosafe/toolchain/opt/eldk-5.2.1/ /opt/`
Afterwards you need to install the programs under `tools` using:

	make
	make install
This installs the cross-compiler toolchain and also some aes-related programs that are needed in the subscripts.

To create the SD-Card for the picosafe call as **root** (not sudo) `./rootfs/genrootfs.sh <sdcard> <key> <bootloader> [<pemfile>]`

Be sure to call `make clean` before commiting anything. At the moment the `.gitignore` is not set to ignore binary files.

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

## Changements:

20-03-2014: added the bootloader as argument for the script `rootfs/genrootfs.sh`

20-03-2014: corrected the location of the `welcome`-folder

## ToDo:

- change the filesystem-type to FAT32 for easier usage under MacOSX

## How could you contribute?
1. [Fork this project][fork] to your account.
2. [Create a new branch][branch] for the improvements, you intend to make.
3. **Make the changements in your fork.**
4. [Send a pull-request][pr] from your fork’s branch to my `master` branch.
 
You can always use the web-interface to make the changes you want. It helps you automizing the workflow from above.

[fork]: http://help.github.com/forking/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: http://help.github.com/pull-requests/
