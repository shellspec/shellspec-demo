#!/bin/sh

docker build -t shellspec-demo .
docker run -it shellspec-demo
