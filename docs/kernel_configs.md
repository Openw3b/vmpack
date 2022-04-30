# Kernel configs

Some apps and features require some modules in the kernel. We will document them here

## Webcam drivers - UVC

```
CONFIG_USB_VIDEO_CLASS=y
```

Ref: https://www.kernelconfig.io/config_usb_video_class?q=&kernelversion=5.17.5&arch=arm64

## VirtioFS support

```
CONFIG_VIRTIO=y
CONFIG_VIRTIO_FS=y
CONFIG_DAX=y
CONFIG_FS_DAX=y
CONFIG_DAX_DRIVER=y
CONFIG_ZONE_DEVICE=y
```

Ref: https://virtio-fs.gitlab.io/howto-qemu.html