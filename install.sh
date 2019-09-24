#!/usr/bin/env bash

cat << EOF
----
KOMMANDO installation script.
----

Installs usefull commands, you can also use this to upgrade whenever new commands are added.

EOF

checkarch=$(uname -m)
checkos=$(uname -s)

echo $checkarch
echo $checkos
