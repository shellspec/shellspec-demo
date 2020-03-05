#!/bin/sh

if [ ! -e /.dockerenv ]; then
  echo "This script works only on docker container."
  exit 1
fi

rm .dockerignore
rm .replit
rm docker-entrypoint.sh
rm Dockerfile
rm run.sh
rm -rf .git
rm "$0"

git init
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git add .
git commit -m "Initial commit"
