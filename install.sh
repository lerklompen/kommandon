#!/usr/bin/env bash

usage()
{
cat << EOF
----
KOMMANDON installation script.
----

Installs usefull commands, you can also use this to upgrade whenever new commands are added.

EOF
}

usage

checkarch=$(uname -m)
checkos=$(uname -s)

echo $checkarch
echo $checkos


if [ -f ~/check ]; then
    echo "file found"
    echo "overwritten" > ~/check
else
    touch ~/check
    echo "write this" > ~/check
fi


#if [ -f ~/.aliases ]; then
#    . ~/.aliases
#    source ~/.aliases
#fi


