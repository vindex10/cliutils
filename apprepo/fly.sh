#!/bin/bash
set -x

wget $(gh-get-link 'superfly/flyctl' 'linux_x86_64.tar.gz$' ) -O downloaded.tar.gz
rm -f flyctl.old
mv -f flyctl flyctl.old
tar -xvzf downloaded.tar.gz
rm downloaded.tar.gz
