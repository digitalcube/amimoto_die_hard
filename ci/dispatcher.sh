#!/bin/bash

set -e

if [ ! "true" == "$CI" ] ; then
  bundle exec kitchen test --destroy=always --concurrency=7
  exit $?
fi

if [ "master" == "$CIRCLE_BRANCH" ] ; then
  bundle exec kitchen test --destroy=always --concurrency=7
  exit $?
fi

bundle exec kitchen test ${CIRCLE_BRANCH} --destroy=always --concurrency=7
