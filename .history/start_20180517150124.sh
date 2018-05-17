#!/bin/bash
if [ -n "$1" ] && [ -n "$2" ]
then
  # echo "Strings \"$1\" and \"$2\" are not null."
  echo "Running docker test for the directory: \"$1\" and port number \"$2\""
  docker build image "$1"
  IMAGE = $(docker image ls -q) 
  docker run -it -d -p $2:$2 $IMAGE[0] 
else  
  echo "Please provide parameter: (./start.sh [directory name] [port number])"
fi