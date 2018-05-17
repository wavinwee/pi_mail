#!/bin/bash
if [ -n "$1" ]
then
  # echo "Strings \"$1\" and \"$2\" are not null."
  echo "Running docker test for the directory: \"$1\""
else  
  echo "Please provide parameter"
fi