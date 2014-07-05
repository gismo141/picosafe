# Root-Filesystem

This folder is used for creating the root-filesystem for the Picosafe.

File | Function
---|---
`partitionsdcard.sh` | Formats and creates partition on a SD-card.
`fillsdcard.sh` | Fills the prepared SD-Card with Bootloader, zImage and Rootfs.
`genrootfs.sh` | Creates the rootfs and installs the wanted programs.
  |  
`config` | Holds the configuration for an attached Picosafe
`programs` | List of programs to be installed by `genrootfs.sh`

The folder `files` holds additional files such as `motd`, `sudoers`-file or `rc.local` etc.
If you add programs that need a special configuration-file, add them to this folder and ajust the script `genrootfs.sh` accordingly!