#!/bin/bash

mkdir ~/concourse-pipelines/cf-mgt/temp

spruce merge ~/concourse-pipelines/cf-mgt/params.yml > ~/concourse-pipelines/cf-mgt/temp/params.yml

fly -t sandbox set-pipeline -n -p cf-management --config ~/concourse-pipelines/cf-mgt/pipeline.yml --load-vars-from ~/concourse-pipelines/cf-mgt/temp/params.yml

fly -t sandbox unpause-pipeline -p cf-management

rm -rf ~/concourse-pipelines/cf-mgt/temp
