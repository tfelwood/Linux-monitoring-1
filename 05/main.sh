#!/bin/bash

REGEX="/$"
START="$(date +%s%N)"

if ! [[ $# -eq 1 ]]; then
  echo "Wrong number of arguments. Try again!" >&2
elif ! [[ $1 =~ $REGEX ]]; then
  echo "The parameter must end with '/'. Try again!" >&2
elif ! [[ -d $1 ]]; then
  echo "The argument is not a directory. Try again!" >&2
else
  if chmod +x printInfo.sh; then
  ./printInfo.sh "$1"
  fi
  STOP="$(date +%s%N)"
  EXECUTION_TIME="$(echo $(("$STOP" - "$START")) | awk '{ printf ("%1.1f", $0/1000000000) }' | tr , .)"
  echo "Script execution time (in seconds) = $EXECUTION_TIME"
fi
