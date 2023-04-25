#!/bin/bash

set -e

if [ ! "true" == "$CI" ] ; then
  bundle exec kitchen test --destroy=always --concurrency=9
  exit $?
fi

if [ "main" == "$CIRCLE_BRANCH" ] ; then
  bundle exec kitchen test --destroy=always default-hvm-amimoto
  bundle exec kitchen test --destroy=always woo-hvm-amimoto
  exit $?
fi

# bundle exec kitchen test ${CIRCLE_BRANCH} --destroy=always --concurrency=9
if echo $CIRCLE_BRANCH | grep -q default- ; then
  bundle exec kitchen test ${CIRCLE_BRANCH} --destroy=always --concurrency=9
  exit $?
fi
