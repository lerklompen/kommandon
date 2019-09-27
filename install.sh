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

bash_string="if [ -f ~/.aliases ]; then\n    . ~/.aliases\n    source ~/.aliases\nfi"

case `grep ".kommandon.sh" ~/.bashrc >/dev/null; echo $?` in
  0)
    echo "kommandon.sh not found"
    echo ${bash_string} >> ~/.bashrc
    source ~/.bashrc
  1)
    echo "kommandon.sh found"
  *)
    echo "error finding kommandon.sh"
esac

# check for file and write or overwrite
if [ -f ~/.kommandon.sh ]; then
    echo "file found"
    echo "alias gam='~/bin/gamadv-xtd3/gam'" > ~/.kommandon.sh
else
    touch ~/.kommandon.sh
    echo "#new file" >> ~/.kommandon.sh
    echo "alias gam='~/bin/gamadv-xtd3/gam'" >> ~/.kommandon.sh
fi


#if [ -f ~/.aliases ]; then
#    . ~/.aliases
#    source ~/.aliases
#fi


