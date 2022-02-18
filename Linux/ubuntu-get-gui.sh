#!/bin/bash

APTREADY=$(sudo apt-get update && sudo apt-get upgrade)


DEINSTLL=$(sudo apt-get install tasksel && sudo tasksel install ubuntu-desktop && sudo apt install lightdm && sudo service lightdm start)

echo "apt update && upgrade"
echo ${APTREADY}
echo "DE install START"
echo ${DEINSTLL}