#!/bin/bash
set -x

name=yq_linux_amd64
rm -f $name.old
mv -f $name $name.old
wget $(gh-get-link 'mikefarah/yq' $name'$' )
chmod +x $name
ln -s -f $name yq
