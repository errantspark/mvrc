#!/bin/bash
cat yay_packages.list | grep -v ^# | yay -S --needed --noconfirm -
