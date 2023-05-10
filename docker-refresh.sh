#!/bin/bash

gitLabel=`git branch | grep \* | cut -d ' ' -f2`
docker stop acmetool
docker rm acmetool
docker build -t rmamba/acmetool:$gitLabel .
docker run -d --name acmetool rmamba/acmetool:$gitLabel
