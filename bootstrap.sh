#!/usr/bin/env bash

## Wait Amimot setup
I_ID=`/opt/aws/bin/ec2-metadata | grep instance-id | awk '{print $2}'`

while :
do
echo -n "."
sleep 5
  if [ -f /var/www/vhosts/${I_ID}/wp-config.php ] ; then
    echo
    break
  fi
done

sudo yum -y update

for x in nginx hhvm php-fpm ; do
  if service $x status ; then service $x restart ; fi
done

sleep 3
