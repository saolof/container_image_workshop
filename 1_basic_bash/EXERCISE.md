# How to build a chroot and identify dependencies.

The initial step of making folders and copying binaries should be clear:

```bash
mkdir -p bash-chroot
cd bash-chroot
mkdir -p bin lib lib64
cp /bin/bash bin
cp /bin/ls bin
```

Of course, chrooting and running this will give you file not found
errors when trying to run /bin/bash, because you did not copy its 
dependencies. What may not be clear is how to find those dependencies.


This can be done using the `ldd` command. Try running `ldd /bin/bash` and `ldd /bin/ls` now.
The output should look like:

```
/bin/ls:
	linux-vdso.so.1 (0x00007ffdc16ca000)
	libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007a5642c8b000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007a5642a00000)
	libpcre2-8.so.0 => /lib/x86_64-linux-gnu/libpcre2-8.so.0 (0x00007a5642969000)
	/lib64/ld-linux-x86-64.so.2 (0x00007a5642cee000)
/bin/bash:
	linux-vdso.so.1 (0x00007fff8f167000)
	libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x000072635fb1a000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x000072635f800000)
	/lib64/ld-linux-x86-64.so.2 (0x000072635fcc0000)
  
```


The part on the right is the paths to the files you need to copy. The linux-vdso dependency is just the 
linux kernel API and is injected as a dependency to all executables run on linux and is not copyable.
The most common and annoying dependency is the C standard library (libc), and other common C libraries
for things like terminal display, regexes, and extended linux APIs.


Try building your own chroot now!
