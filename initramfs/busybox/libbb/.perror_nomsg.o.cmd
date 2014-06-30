cmd_libbb/perror_nomsg.o := arm-linux-gnueabi-gcc -Wp,-MD,libbb/.perror_nomsg.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.20.2)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(perror_nomsg)"  -D"KBUILD_MODNAME=KBUILD_STR(perror_nomsg)" -c -o libbb/perror_nomsg.o libbb/perror_nomsg.c

deps_libbb/perror_nomsg.o := \
  libbb/perror_nomsg.c \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include-fixed/limits.h \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include-fixed/syslimits.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/limits.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/features.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/predefs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/cdefs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/wordsize.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/gnu/stubs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/posix1_lim.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/local_lim.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/linux/limits.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/posix2_lim.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/xopen_lim.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/stdio_lim.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/byteswap.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/byteswap.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/endian.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/endian.h \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include/stdint.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/stdint.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/wchar.h \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include/stdbool.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/unistd.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/posix_opt.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/environments.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/types.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/typesizes.h \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include/stddef.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/confname.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/getopt.h \

libbb/perror_nomsg.o: $(deps_libbb/perror_nomsg.o)

$(deps_libbb/perror_nomsg.o):
