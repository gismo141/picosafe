cmd_lib/decompress.o := arm-linux-gnueabi-gcc -Wp,-MD,lib/.decompress.o.d  -nostdinc -isystem /opt/eldk-5.0/armv5te/sysroots/i686-oesdk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.5.1/include -I/tmp/gnublin/lpc3131/kernel/linux-2.6.33-lpc313x/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-lpc313x/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-dwarf2-cfi-asm -fconserve-stack   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(decompress)"  -D"KBUILD_MODNAME=KBUILD_STR(decompress)"  -c -o lib/decompress.o lib/decompress.c

deps_lib/decompress.o := \
  lib/decompress.c \
    $(wildcard include/config/decompress/gzip.h) \
    $(wildcard include/config/decompress/bzip2.h) \
    $(wildcard include/config/decompress/lzma.h) \
    $(wildcard include/config/decompress/lzo.h) \
  include/linux/decompress/generic.h \
  include/linux/decompress/bunzip2.h \
  include/linux/decompress/unlzma.h \
  include/linux/decompress/inflate.h \
  include/linux/decompress/unlzo.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /tmp/gnublin/lpc3131/kernel/linux-2.6.33-lpc313x/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /tmp/gnublin/lpc3131/kernel/linux-2.6.33-lpc313x/arch/arm/include/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  /tmp/gnublin/lpc3131/kernel/linux-2.6.33-lpc313x/arch/arm/include/asm/posix_types.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /opt/eldk-5.0/armv5te/sysroots/i686-oesdk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.5.1/include/stdarg.h \
  /tmp/gnublin/lpc3131/kernel/linux-2.6.33-lpc313x/arch/arm/include/asm/string.h \

lib/decompress.o: $(deps_lib/decompress.o)

$(deps_lib/decompress.o):
