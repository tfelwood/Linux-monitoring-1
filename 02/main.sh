#!/bin/bash

if [[ $# -eq 0 ]]; then
  chmod +x printInfo.sh
  LOGS="$(./printInfo.sh)"
  cat <<< "$LOGS"
  chmod +x writeLogs.sh
  ./writeLogs.sh "$LOGS"
else
  echo "Error! Script takes no arguments!" >&2
fi
