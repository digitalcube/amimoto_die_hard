#!/bin/bash

set -e

if [ ! "true" == "$CI" ] ; then
  bundle exec kitchen test --destroy=always --concurrency=7
  exit $?
fi

if [ "master" == "$CIRCLE_BLANCH" ] ; then
  bundle exec kitchen test --destroy=always --concurrency=7
  exit $?
fi

bundle exec kitchen test ${CIRCLE_BLANCH} --destroy=always --concurrency=7
