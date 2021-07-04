tee | awk -v"f=$(cat $1)" '{ if ($0~/^#[^#]/) { print f"\n"$0 } else { print $0 } }'
