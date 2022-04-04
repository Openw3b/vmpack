qemu-system-x86_64-spice -machine vmport=off \
   -enable-kvm -cpu host -m 1024m -smp 4 \
   -kernel bzImage \
   -append "root=/dev/vda rw init=/init" \
   -drive id=root,file=/mnt/ramdisk/fs.qcow2,format=qcow2,if=none \
   -device virtio-rng-pci \
   -device virtio-blk-pci,drive=root \
   -nic user,model=virtio \
   -vga virtio \
   -soundhw hda \
   -device virtio-tablet-pci,id=input2,bus=pci.0,addr=0x9 -spice port=0,disable-ticketing,image-compression=off,seamless-migration=on \
   -spice unix,addr=vm.sock,disable-ticketing  \
   -device virtio-serial -chardev spicevmc,id=vdagent,debug=0,name=vdagent \
   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
   -monitor unix:monitor.sock,server,nowait \
   -loadvm s1 \
   & remote-viewer spice+unix://vm.sock
   
