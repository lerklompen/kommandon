#!/usr/bin/env

checkos=$(uname -s)
uname -a
echo $checkos

add_kommandon()
{
  curl https://raw.githubusercontent.com/lerklompen/kommandon/master/kommandon > ~/.kommandon
  # check for dir "gam"
  if [ -d ~/gam ]; then
    echo "dir 'gam' found"
  else
    mkdir ~/gam
  fi
}

usage()
{
cat << EOF
----
KOMMANDON installation script running...
----

EOF
}

usage

# TODO - Mac: ".bash_profile" Linux: ".bashrc"

bash_string="if [ -f ~/.kommandon ]; then\n    . ~/.kommandon\n    source ~/.kommandon\nfi"
profile_string="source ~/.bashrc"

case `grep "kommandon" ~/.bashrc >/dev/null; echo $?` in
  0)
    echo "kommandon found"
    add_kommandon
    ;;
  1)
    echo "kommandon not found"
    echo -e ${bash_string} >> ~/.bashrc
    if [ checkos = "DARWIN" ]; then
      touch ~/.bash_profile
      echo -e ${profile_string} >> ~/.bash_profile
    fi
    add_kommandon
    ;;
  *)
    echo "error finding .kommandon"
    ;;
esac

echo "Now type 'exit' and restart terminal"




