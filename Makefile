

boot_dir := boot
android_x86.iso: $(boot_dir)
	genisoimage -vJURT -b isolinux/isolinux.bin -c isolinux/boot.cat \
                -no-emul-boot -boot-load-size 4 -boot-info-table \
                -input-charset utf-8 -V "Android-x86 LiveCD" -o $@ $^

iso: android_x86.iso

img:
	mksquashfs boot/system system.sfs
