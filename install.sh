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

# TODO - mac: ".bash_profile" Linux: ".bashrc"

bash_string="if [ -f ~/.kommandon ]; then\n    . ~/.kommandon\n    source ~/.kommandon\nfi"

case `grep ".kommandon" ~/.bashrc >/dev/null; echo $?` in
  0)
    echo ".kommandon not found"
    echo -e ${bash_string} >> ~/.bashrc
    source ~/.bashrc
    ;;
  1)
    echo ".kommandon found"
    ;;
  *)
    echo "error finding .kommandon"
    ;;
esac

# check for file and write or overwrite
if [ -f ~/.kommandon ]; then
    echo "file found"
    echo "alias gam='~/bin/gamadv-xtd3/gam'" > ~/.kommandon
else
    touch ~/.kommandon
    echo "#new file" >> ~/.kommandon
    echo "alias gam='~/bin/gamadv-xtd3/gam'" >> ~/.kommandon
fi


#if [ -f ~/.aliases ]; then
#    . ~/.aliases
#    source ~/.aliases
#fi


