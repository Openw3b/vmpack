#gcc -Wall -o init -static init.c
sudo rm /mnt/ramdisk/fs.qcow2 /mnt/ramdisk/fs.tar
DOCKER_BUILDKIT=1 docker build --output "type=tar,dest=/mnt/ramdisk/fs.tar" .
sudo virt-make-fs --format=qcow2 --size=+1G /mnt/ramdisk/fs.tar /mnt/ramdisk/fs.qcow2
sudo chown user:user /mnt/ramdisk/fs.qcow2
#sudo rm alpine.tar
#qemu-img convert alpine-large.qcow2 -O qcow2 alpine.qcow2
#cp alpine-large.qcow2 ../os/alpine.qcow2
