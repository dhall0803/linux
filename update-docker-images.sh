#!/bin/bash

echo "Updating Docker Images"

for image in $(docker images | cut -f1 -d$' ')
do
    if ["$image" != "REPOSITORY"]
    then
        docker pull "$image"
    fi
done