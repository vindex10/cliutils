#!/bin/bash
set -x

name=$(gh-get-link 'Wilfred/difftastic' '-x86_64-unknown-linux-gnu.tar.gz' -n)
url=$(gh-get-link 'Wilfred/difftastic' '-x86_64-unknown-linux-gnu.tar.gz')

rm -f *.bak
mv difft difft.bak

wget $url
tar -xvzf "$name"
rm "$name"
chmod +x difft
