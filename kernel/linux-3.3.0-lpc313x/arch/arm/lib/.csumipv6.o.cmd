cmd_arch/arm/lib/csumipv6.o := arm-linux-gnueabi-gcc -Wp,-MD,arch/arm/lib/.csumipv6.o.d  -nostdinc -isystem /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include -I/opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /opt/picosafe/kernel/linux-3.3.0-lpc313x/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-lpc31xx/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables  -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -include asm/unified.h -msoft-float        -c -o arch/arm/lib/csumipv6.o arch/arm/lib/csumipv6.S

source_arch/arm/lib/csumipv6.o := arch/arm/lib/csumipv6.S

deps_arch/arm/lib/csumipv6.o := \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/linkage.h \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/hwcap.h \
  /opt/picosafe/kernel/linux-3.3.0-lpc313x/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/use/domains.h) \

arch/arm/lib/csumipv6.o: $(deps_arch/arm/lib/csumipv6.o)

$(deps_arch/arm/lib/csumipv6.o):
