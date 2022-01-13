#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin

diff  $1 /etc/hosts  &>/dev/null

if [ $? -ne 0 ]; then

    cp $1 /etc/hosts

fi

exit 0
