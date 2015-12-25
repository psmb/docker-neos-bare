#!/bin/bash

REPOSITORY_URL=${REPOSITORY_URL:=""}

if [ -d /data/www/releases/current ] || [ -z "$REPOSITORY_URL" ]
then
    echo "Do nothing, Neos distr is already there or REPOSITORY_URL env variable not set"
else
    touch i
    ansible-playbook /config/setup-neos.yml --extra-vars "REPOSITORY_URL=${REPOSITORY_URL}" -i 'i'
fi
