cmd_libbb/kernel_version.o := arm-linux-gnueabi-gcc -Wp,-MD,libbb/.kernel_version.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.20.2)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(kernel_version)"  -D"KBUILD_MODNAME=KBUILD_STR(kernel_version)" -c -o libbb/kernel_version.o libbb/kernel_version.c

deps_libbb/kernel_version.o := \
  libbb/kernel_version.c \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/selinux.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/getopt/long.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/devfs.h) \
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
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/ctype.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/xlocale.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/dirent.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/dirent.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/linux/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/errno.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/errno-base.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/fcntl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/fcntl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/types.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/time.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/select.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/select.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sigset.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/time.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/sysmacros.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/pthreadtypes.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/uio.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/stat.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/inttypes.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/netdb.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/netinet/in.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/socket.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/uio.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/socket.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sockaddr.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/socket.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/sockios.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/in.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/rpc/netdb.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/siginfo.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/netdb.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/setjmp.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/setjmp.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/signal.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/signum.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sigaction.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sigcontext.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/sigcontext.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sigstack.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/ucontext.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/procfs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/time.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/user.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sigthread.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/stdio.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/libio.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/_G_config.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/wchar.h \
  /opt/eldk-5.2.1/armv5te/sysroots/i686-eldk-linux/usr/lib/armv5te-linux-gnueabi/gcc/arm-linux-gnueabi/4.6.4/include/stdarg.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/sys_errlist.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/stdlib.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/waitflags.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/waitstatus.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/alloca.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/string.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/libgen.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/poll.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/poll.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/ioctl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/ioctls.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/ioctls.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/ioctls.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/linux/ioctl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/ioctl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm-generic/ioctl.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/ioctl-types.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/ttydefaults.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/mman.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/mman.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/stat.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/wait.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/resource.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/resource.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/termios.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/termios.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/param.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/linux/param.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/asm/param.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/pwd.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/grp.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/mntent.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/paths.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/statfs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/statfs.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/utmp.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/utmp.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/arpa/inet.h \
  include/xatonum.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/sys/utsname.h \
  /opt/eldk-5.2.1/armv5te/sysroots/armv5te-linux-gnueabi/usr/include/bits/utsname.h \

libbb/kernel_version.o: $(deps_libbb/kernel_version.o)

$(deps_libbb/kernel_version.o):
