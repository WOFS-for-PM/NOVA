#!/usr/bin/bash


if [ ! "$1" ]; then
    dev=/dev/pmem0
else
    dev=$1
fi

if [ ! "$2" ]; then
    mnt=/mnt/pmem0
else
    mnt=$2
fi

if [ ! "$3" ]; then
    make -j32
else 
    make "$3"
fi

if [ ! "$4" ]; then
    measure_timing=1
else 
    measure_timing=$4
fi

sudo umount "$mnt"

sudo rmmod nova 
sudo insmod nova.ko measure_timing="$measure_timing" wprotect=1

sudo mount -t NOVA -o init "$dev" "$mnt"