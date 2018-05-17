#!/bin/bash
if [ -n "$1" ]
then
  echo "Strings \"$1\" and \"$2\" are not null."
else  
  echo "Strings \"$1\" and \"$2\" are null."
fi