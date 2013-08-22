#!/bin/bash

ls /usr/bin/ | grep ^lv

if [ $? -eq 0 ]

then

echo "link exist" > /dev/null

else

/bin/ln -s /usr/sbin/lv* /usr/bin/

fi
