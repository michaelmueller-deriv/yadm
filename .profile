# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

 xrandr --newmode "2560x1440_30.00" 146.25 2560 2680 2944 3328 1440 1443 1448 1468
 xrandr --addmode HDMI-1 2560x1440_30.00

# setup modem for wirles ear buds to work as microphone see https://askubuntu.com/questions/831331/failed-to-change-profile-to-headset-head-unit
ofono-phonesim -p 12345 /usr/share/phonesim/default.xml&
#mount /opt/nextcloud

export PATH="$HOME/.cargo/bin:$PATH"
