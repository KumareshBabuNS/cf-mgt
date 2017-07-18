#!/bin/bash

ORG_NAME=$1

if [ $# -eq 0 ]; then
  echo "ORG Name is a required parameter"
  exit 1
fi

if [ ! -d "config" ]; then
  echo "Cannot be ran from this directory. Missing ./config"
  exit 1
fi

cf-mgmt add-org-to-config --org $ORG_NAME 

for space in DEV INT STAGING UAT
do 
  cf-mgmt add-space-to-config --org $ORG_NAME --space $space
done
