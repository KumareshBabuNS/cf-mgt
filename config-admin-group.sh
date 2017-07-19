#!/bin/bash

list=$(uaac user get admin | grep "display" | awk '{print $2}')

while read -r line; do
    echo "... $line ..."
    uaac group map --name $line "CN=pcf-admins,OU=groups,OU=Engineering,DC=ad,DC=cf,DC=us-east-1,DC=arity-sandbox,DC=com" 
done <<< "$list"
