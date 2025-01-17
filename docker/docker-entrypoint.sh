#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

curl -f https://raw.githubusercontent.com/toniebox-reverse-engineering/tonies-json/release/tonies.json -o /teddycloud/config/tonies.json || true

while true
do
  cd /teddycloud
  teddycloud
  retVal=$?
  if [ $retVal -ne -2 ]; then
      exit $retVal
  fi
done
