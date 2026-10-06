#!/bin/bash
# Starts (or restarts) Apache so the new files are served.
set -e
if systemctl list-unit-files | grep -q '^apache2'; then
  SERVICE=apache2
else
  SERVICE=httpd
fi
systemctl enable "$SERVICE"
systemctl restart "$SERVICE"
