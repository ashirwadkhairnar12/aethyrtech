#!/bin/bash
# Fails the deployment if the site isn't responding.
set -e
sleep 2
curl -sf http://localhost/ > /dev/null
echo "Site is up"
