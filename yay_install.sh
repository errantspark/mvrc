#!/bin/bash
cat packages.list | grep -v ^# | yay -S --needed --noconfirm -
