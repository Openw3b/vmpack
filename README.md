# VMPack

Run GUI linux applications in QEMU VMs. (Experimental crosvm support being added)

## Prerequisites:
1. Ubuntu based distro (for now)
1. Docker installed and user added to docker group via `sudo gpasswd -a $USER docker`
2. Other dependencies installed `sudo apt install git libguestfs-tools socat virt-manager`
3. Reboot your system or reload your session

## Features

- GPU Acceleration via virtio-gpu with gl=on
- Drag and drop
- Window Resize
- Clipboard (need to limit permission)
- Sound and microphone (need to limit permission)

To get started,

1. Install vmpack
```
cd ~/
git clone git@github.com:Openw3b/vmpack.git .vmpack
ln -s ~/.vmpack/vmpack ~/.local/bin/vmpack
```

2. Build and install an App [Example]
```
vmpack build firefox
vmpack install firefox Firefox1
```

> No spaces in the app name.
> The install might take some time for the first time

3. Open the app from Desktop, Applications or via

```
vmpack start Firefox1
```

You should see Firefox1 loaded.



## 