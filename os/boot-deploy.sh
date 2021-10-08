#!/bin/bash
set -x

pushd /boot

function deploy_gentoo() {
	regentoo=efi/EFI/gentoo 
	version="$1"
	linux="vmlinuz-$version-gentoo"
	initrd="initramfs-$version-gentoo.img"
	if [ ! -f "$linux" ] || [ ! -f "$initrd" ]; then
		echo "Kernel or Initramfs does not exist."
		exit 1;
	fi;
	pushd "$regentoo"
	rm -rf old
	mkdir old
	mv vmlinuz* old
	mv initramfs* old
	popd
	cp "$linux" "$regentoo"
	cp "$initrd" "$regentoo"
}

function ubuntu_cleanup() {
	set -e
	pushd efi/EFI/ubuntu
	rm -f *.CSV
	rm -f *.cfg
	rm -f *.efi
	popd
	set +e
}

function deploy_ubuntu() {
	reubuntu=efi/EFI/ubuntu
	version="$1"
	linux="vmlinuz-$version-generic"
	initrd="initrd.img-$version-generic"
	if [ ! -f "$linux" ] || [ ! -f "$initrd" ]; then
		echo "Kernel or Initramfs does not exist."
		exit 1;
	fi;
	ubuntu_cleanup
	pushd "$reubuntu"
	rm -rf old
	mkdir old
	mv vmlinuz* old
	mv initrd* old
	popd
	cp "$linux" "$reubuntu"
	cp "$initrd" "$reubuntu"
}

function bootloaders() {
	grub-mkconfig -o /boot/grub/grub.cfg
	grub-install --target=i386-pc /dev/sda
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
	refind-install
}

function get_latest() {
	tag="$1"
	echo $(ls -1 | grep vmlinuz | grep "$tag" | grep -v "old$" | sed 's/^vmlinuz-//' | sed "s/-$tag//" | sort -V | tail -n1)
}

cmd="$1"
version="$2"

case "$cmd" in
	gentoo)
		inferred_version="$version"
		if [ -z "$inferred_version" ]; then
			inferred_version=$(get_latest gentoo)
		fi;
		deploy_gentoo "$inferred_version"
	;;
	ubuntu)
		inferred_version="$version"
		if [ -z "$inferred_version" ]; then
			inferred_version=$(get_latest generic)
		fi;
		deploy_ubuntu "$inferred_version"
	;;
	boot)
		bootloaders	
	;;
	*)
		echo "deploy.sh gentoo [5.4.28]"
		echo "deploy.sh ubuntu [5.4.28-45]"
		echo "deploy.sh boot"
	;;
esac

popd

echo "SUCCESS"
