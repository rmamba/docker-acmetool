#!/bin/bash

gitLabel=`git branch | grep \* | cut -d ' ' -f2`
docker build -t rmamba/acmetool:$gitLabel .
