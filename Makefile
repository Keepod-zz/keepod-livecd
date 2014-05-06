

boot_dir := boot

img:
	mksquashfs system boot/system.sfs -noappend

keepod.iso: $(boot_dir) 
	genisoimage -vJURT -b isolinux/isolinux.bin -c isolinux/boot.cat \
                -no-emul-boot -boot-load-size 4 -boot-info-table \
                -input-charset utf-8 -V "Android-x86 LiveCD" -o $@ $^

iso: img keepod.iso

