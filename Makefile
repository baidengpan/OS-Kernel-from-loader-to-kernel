all:boot.asm kernel.asm
	nasm -o boot.bat boot.asm
	nasm -o kernel.bat kernel.asm
	sudo dd if=/dev/zero of=system.img bs=512 count=2048
	sudo dd if=boot.bat of=system.img bs=512 count=1 conv=notrunc
	sudo dd if=kernel.bat of=system.img bs=512 seek=37 count=1 conv=notrunc
	# mkdir mnt
	# sudo mount system.img mnt
	# sudo hdiutil attach -readwrite system.img -mountpoint mnt
	# cp kernel.bat mnt
	# hdiutil detach mnt

obj:
	nasm -o boot.bat boot.asm
	nasm -o kernel.bat kernel.asm

clean:
	rm boot.bat
	rm kernel.bat
	rm system.img