#!/bin/bash
if [ -n "$1" ] && [ -n "$2" ]
then
  
  # INITCONTAINER=$(docker ps -q)
  # if [ -n "$INITCONTAINER" ]
  # then
  #   docker kill $(docker ps -q)
  # fi
  echo "Running docker test for the directory: \"$1\" and port number \"$2\""
  docker build "$1"
  IMAGE=$(docker image ls -q | head -1)
  docker run -it -d -p $2:$2 $IMAGE 
  CONTAINER=$(docker ps -q | head -1)
  docker exec -it $CONTAINER bash
else  
  echo "Please provide parameter: (./start.sh [directory name] [port number])"
fi