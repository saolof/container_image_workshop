# Skopeo, Umoci, and runc

Skopeo and Umoci are a pair of low-level inspection tools by red hat.
Skopeo just inspects images and pulls them to a local folder:

```bash
  skopeo inspect docker://debian:latest 
  skopeo copy docker://debian:latest oci:debian:latest
```

We can use this to pull any image into a local folder to take a look at it.
It is just a set of text files and tar balls! Find the order of the layers
and 'tar -xvf' them into a folder, and you'll find that you can chroot into them!

Having confirmed that container images from dockerhub are just fancily tarballed
filesystems with a few sha hash manifests, we can continue by looking at how
containers are just fancy folders and how a container runtime is a fancy chroot.

Next, we can use umoci as a fancy way to do the basic untar procedure into
a container bundle (the untarred folder with the filesystem that gets executed).

```bash
umoci stat --image debian:latest 
sudo umoci unpack --image debian:latest debian_bundle
```
As we can see, it is just a folder along with some information on things like env variables
and startup commands. We can chroot into it. We can also do the following while in the folder:

```bash
sudo runc run test
```

Unlike the previous two tools, runc is in extremely wide use. It is a fancy chroot command and is what
docker/podman/kubernetes actually calls when you run a container. It does not take CLI arguments,
instead all the fancy flags on something like podman are passed via the json files in the folder outside of root.

Docker and kubernetes sends a rest api call to containerd which runs as root and runs runc to avoid requiring sudo.
Podman is just a frontend for a library called libpod which calls runc with proper setup.
