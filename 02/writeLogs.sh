#!/bin/bash

if [[ $# -eq 1 ]]; then
  echo "Write the data to file? Press Y to approve or N to reject."
  read -r USER_ANSWER
  if [[ $USER_ANSWER = "Y" ]] || [[ $USER_ANSWER = "y" ]]; then
    FILENAME="$(date +"%d_%m_%g_%H_%M_%S").status"
    cat <<< "$1" > "$FILENAME"
  fi
fi
