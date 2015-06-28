#!/usr/bin/env bash


for x in {1..60}; do echo '.' ; sleep 8 ; done
sudo yum -y update

for x in nginx hhvm php-fpm ; do
  if service $x status ; then service $x restart ; fi
done

