#!/usr/bin/env bash

add_kommandon()
{
  curl https://raw.githubusercontent.com/lerklompen/kommandon/master/kommandon > ~/.kommandon
  # check for file and write or overwrite
  #if [ -f ~/.kommandon ]; then
    #echo "file found"
    #echo "alias gam='~/bin/gamadv-xtd3/gam'" > ~/.kommandon
  #else
    #touch ~/.kommandon
    #echo "#new file" >> ~/.kommandon
    #echo "alias gam='~/bin/gamadv-xtd3/gam'" >> ~/.kommandon
  #fi
# perform "source"
}

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

case `grep "kommandon" ~/.bashrc >/dev/null; echo $?` in
  0)
    echo "kommandon found"
    add_kommandon
    ;;
  1)
    echo "kommandon not found"
    echo -e ${bash_string} >> ~/.bashrc
    add_kommandon
    ;;
  *)
    echo "error finding .kommandon"
    ;;
esac

echo "now run this command:"
echo "source ~/.bashrc"

#if [ -f ~/.aliases ]; then
#    . ~/.aliases
#    source ~/.aliases
#fi


