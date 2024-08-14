# From chroots to images

Now that you are familiar with chroots, let's mention
a huge advantage they have: they are easy to ship!

Since they are just folders, they can just be compressed
into a tarball or a zip archive and sent to the target machine.
This made them a standard tool of ops teams before containers,
just unzip, and run with chroot to make it work regardless of
the local distribution


Compare to the Docker way of doing things,
where the commands are moved into a dockerfile with
a builder step, followed by copying the "chroot" into
the final from scratch image.
