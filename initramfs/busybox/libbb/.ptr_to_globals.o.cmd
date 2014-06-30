cmd_libbb/ptr_to_globals.o := arm-linux-gnueabi-gcc -Wp,-MD,libbb/.ptr_to_globals.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.20.2)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ptr_to_globals)"  -D"KBUILD_MODNAME=KBUILD_STR(ptr_to_globals)" -c -o libbb/ptr_to_globals.o libbb/ptr_to_globals.c

deps_libbb/ptr_to_globals.o := \
  libbb/ptr_to_globals.c \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/features.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/predefs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/cdefs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/wordsize.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/gnu/stubs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/linux/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/errno-base.h \

libbb/ptr_to_globals.o: $(deps_libbb/ptr_to_globals.o)

$(deps_libbb/ptr_to_globals.o):
