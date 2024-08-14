# Layered images

Since we made chroots with an imperative process, we don't
have to put everything in the same tarball. We can instead
zip a bunch of common stuff first, zip it, and then copy
more stuff into a second tarball.

Then, to run it, unzip both tarballs into the same folder and 
run with chroot like before. Let's add stuff to our previous image.
