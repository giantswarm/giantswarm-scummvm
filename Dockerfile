# ScummVM over VNC
#
# VERSION               0.1

FROM    ubuntu:14.04
# make sure the package repository is up to date
RUN     echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN     apt-get update

# Install vnc, xvfb in order to create a 'fake' display and ScummVM
RUN     apt-get install -y x11vnc xvfb scummvm
RUN     mkdir ~/.vnc
# Setup a password
RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart ScummVM (might not be the best way to do it, but it does the trick)
RUN     bash -c 'echo "./usr/games/scummvm" >> /.bashrc'