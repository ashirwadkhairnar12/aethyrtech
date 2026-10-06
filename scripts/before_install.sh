#!/bin/bash
# Installs Apache if missing and clears the web root before new files are copied.
set -e
if command -v apt-get >/dev/null 2>&1; then
  if ! dpkg -s apache2 >/dev/null 2>&1; then
    apt-get update -y
    apt-get install -y apache2
  fi
else
  if ! rpm -q httpd >/dev/null 2>&1; then
    if command -v dnf >/dev/null 2>&1; then dnf install -y httpd; else yum install -y httpd; fi
  fi
fi
mkdir -p /var/www/html
rm -rf /var/www/html/*
