#!/usr/bin/env

checkos=$(uname -s)
uname -a
echo $checkos

if [ checkos = "DARWIN" ]; then
  sed="gsed"
else
  sed="sed"
fi

add_kommandon()
{
  curl https://raw.githubusercontent.com/lerklompen/kommandon/master/kommandon > ~/.kommandon
  source ~/gam/.ad_user
  gsed -i "s/_userid_/$ad_user/g" ~/.kommandon
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

# setup AD user and password
if [ ! -f ~/gam/.ad_user ]; then
  echo -ne "Please write your AD username and press ENTER:"
  read ad_user
  touch ~/gam/.ad_user
  echo -n "ad_user=${ad_user}" > ~/gam/.ad_user
  if [ ! -f ~/gam/.pass.txt ]; then
    nano ~/password.txt && cat ~/password.txt | tr -d "\n" > ~/gam/.pass.txt && rm ~/password.txt && chmod 600 ~/gam/.pass.txt
  fi
fi

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

