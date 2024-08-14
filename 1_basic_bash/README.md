# The precursor to containers: chroots

The chroot command is the precursor to containers. It is similar to
(but cheaper to run than) sudo and just runs a command (a shell by default),
except it does so:
1) As the root user
2) Using a provided folder as the root directory.

On most systems, it requires sudo to run.
The linked script creates a chroot on a (my) ubuntu system. Run it to
create folders, and then run:

```bash
  sudo chroot ./bash-chroot ls
  sudo chroot ./bash-chroot
```
