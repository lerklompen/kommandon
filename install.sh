#!/usr/bin/env

checkos=$(uname -s)
uname -a
echo $checkos

# install or update new commands
add_kommandon()
{
  curl https://raw.githubusercontent.com/lerklompen/kommandon/master/kommandon > ~/.kommandon
  source ~/gam/.ad_user
  source ~/gam/.ad_conf
  if [ "$checkos" == "Darwin" ]; then
    echo "using 'gsed'..."
    gsed -i "s/_userid_/$ad_user/g" ~/.kommandon
    gsed -i "s/_ldapurl_/$ad_conf/g" ~/.kommandon
  else
    echo "using 'sed'..."
    sed -i "s/_userid_/$ad_user/g" ~/.kommandon
    sed -i "s/_ldapurl_/$ad_conf/g" ~/.kommandon
  fi
  # check for dir "gam"
  if [ -d ~/gam ]; then
    echo "dir 'gam' found"
  else
    mkdir ~/gam
  fi
}

# message during install
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
    echo "You must now also run the command 'AD_password' to be able to use the 'AD'-commands"
  fi
fi
if [ ! -f ~/gam/.ad_conf ]; then
  echo -ne "Please write your AD url and press ENTER:"
  read ad_conf
  touch ~/gam/.ad_conf
  echo -n "ad_conf=${ad_conf}" > ~/gam/.ad_conf
fi

bash_string="if [ -f ~/.kommandon ]; then\n    . ~/.kommandon\n    source ~/.kommandon\nfi"
profile_string="source ~/.bashrc"

case `grep "kommandon" ~/.bashrc >/dev/null; echo $?` in
  0)
    echo "KOMMANDON found - updating with new commands"
    add_kommandon
    ;;
  1)
    echo "KOMMANDON not found - first install"
    echo -e ${bash_string} >> ~/.bashrc
    if [ "$checkos" = ""Darwin"" ]; then
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

