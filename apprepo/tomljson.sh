#!/bin/bash
set -x

function get() {
	name="$1"
	rm -f $name.old
	mv -f $name $name.old
	fname=$(gh-get-link 'pelletier/go-toml' $name'.+linux_amd64.tar.xz$' -n )
	wget $(gh-get-link 'pelletier/go-toml' $name'.+linux_amd64.tar.xz$' )
	tar -xvf "$fname"
	rm "$fname"
	chmod +x $name
}

get tomljson
get jsontoml
