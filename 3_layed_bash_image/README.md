# Layered images

Since we made chroots with an imperative process, we don't
have to put everything in the same tarball. We can instead
zip a bunch of common stuff first, zip it, and then copy
more stuff into a second tarball.

Then, to run it, unzip both tarballs into the same folder and 
run with chroot like before. Let's add some conveniences to our previous images.


## Comparison to dockerfiles.


Docker images also use layering. It is just a couple of json metadata text files and
a set of tar archives that get extracted on top of each other. Each Dockerfile command
corresponds to one layer, which is why authors usually try to reduce the number of layers!

![Dockerfile](https://docs.docker.com/build/guide/images/layers.png)


The from clause defines another stack of images that new commands stack tarballs on top of.


## A fancy way to layer files: overlays.

Linux has a command called mount which can be used with a
fancy filesystem called overlayfs which allows us to merge untarred
layers without duplicating files. It takes a lower directory which is
read only, and an upper directory where changes go.

![Overlays](https://tunnelix.com/wp-content/uploads/2024/02/overlay.jpg)
