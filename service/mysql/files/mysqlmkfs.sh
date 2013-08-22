#!/bin/bash

LV_NAME="mysql"

# check the fstab

grep $LV_NAME /etc/fstab

        if [ $? -eq 0 ]

        then

        echo "exsit" > /dev/null ; exit 0

	fi

# check the os version

OS=$(cat /etc/redhat-release)

## create ext4 filesystem ##

echo $OS | grep 6 

if [ $? = 0 ] 

then

/sbin/mkfs -t ext4 /dev/domuvg/$LV_NAME

## config fstab ##

echo "/dev/domuvg/$LV_NAME /var/lib/$LV_NAME ext4 defaults 0 0" >> /etc/fstab

fi
## create ext3 filesystem ##

echo $OS | grep 5

if [ $? = 0 ]

then

/sbin/mkfs -t ext3 /dev/domuvg/$LV_NAME

## config fstab ##

echo "/dev/domuvg/$LV_NAME /var/lib/$LV_NAME ext3 defaults 0 0" >> /etc/fstab

fi

## mounted ##

mount -a
