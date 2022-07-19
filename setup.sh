#!/usr/bin/bash


if [ ! "$1" ]; then
    dev=/dev/pmem1
else
    dev=$1
fi

if [ ! "$2" ]; then
    mnt=/mnt/pmem1
else
    mnt=$2
fi

if [ ! "$3" ]; then
    make
else 
    make "$3"
fi

if [ ! "$4" ]; then
    measure_timing=0
else 
    measure_timing=$4
fi

sudo umount "$dev"

sudo rmmod nova 
sudo insmod nova.ko measure_timing="$measure_timing"

sudo mount -t NOVA -o init,data_cow "$dev" "$mnt"