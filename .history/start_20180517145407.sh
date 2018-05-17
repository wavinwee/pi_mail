#!/bin/bash
if [ -n "$1" && -n "$2" ]
then
  # echo "Strings \"$1\" and \"$2\" are not null."
  echo "Running docker test for the directory: \"$1\""
  docker build image "$1"
  docker run -it -d -p 
else  
  echo "Please provide parameter (./start.sh [directory name] [port number])"
fi