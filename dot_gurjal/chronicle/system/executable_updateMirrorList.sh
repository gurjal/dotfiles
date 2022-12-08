#!/bin/sh
sudo reflector --verbose --country 'United States' --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
