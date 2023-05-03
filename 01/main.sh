#!/bin/bash

REGEX="^[+-]?[0-9]+([.,][0-9]+)?$"

if [[ $# -eq 1 ]]; then
  if [[ $1 =~ $REGEX ]]; then
    echo "Error! The argument must be a string!" >&2
  else echo $1;
  fi
else echo "Error! Wrong number of arguments!" >&2
fi

