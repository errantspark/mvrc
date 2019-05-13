#!/bin/bash
cat packages.list | grep -v ^# | pacman -S --needed --noconfirm -
