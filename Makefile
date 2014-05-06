
PATH=/bin:/usr/bin:./tools
boot_dir := boot

img:
	tools/mkuserimg.sh system system.img ext4 system 0 file_contexts	
	mksquashfs system.img boot/system.sfs -noappend

keepod.iso: $(boot_dir) 
	genisoimage -vJURT -b isolinux/isolinux.bin -c isolinux/boot.cat \
                -no-emul-boot -boot-load-size 4 -boot-info-table \
                -input-charset utf-8 -V "Android-x86 LiveCD" -o $@ $^

iso: img keepod.iso

