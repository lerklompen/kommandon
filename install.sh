#!/usr/bin/env bash

cat << EOF
GAM installation script.

OPTIONS:
   -h      show help.
   -d      Directory where gam folder will be installed. Default is \$HOME/bin/
   -a      Architecture to install (i386, x86_64, x86_64_legacy, arm, arm64). Default is to detect your arch with "uname -m".
   -o      OS we are running (linux, macos). Default is to detect your OS with "uname -s".
   -l      Just upgrade GAM to latest version. Skips project creation and auth.
   -p      Profile update (true, false). Should script add gam command to environment. Default is true.
   -u      Admin user email address to use with GAM. Default is to prompt.
   -r      Regular user email address. Used to test service account access to user data. Default is to prompt.
   -v      Version to install (latest, prerelease, draft, 3.8, etc). Default is latest.
EOF
