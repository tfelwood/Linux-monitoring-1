#!/bin/bash

REGEX="^[0-9]+$"
mask=""

if [[ $# -eq 1 ]] && [[ $1 =~ $REGEX ]] && [[ $1 -le 32 ]] ; then
  (( mask_num=$(((($(echo "2^32" | bc -ql) - 1) << (32 - $1)) % $(echo "2^32" | bc -ql))) ))
  for ((i = 0; i < 4; ++i))
  do
    (( byte_num=$(("$mask_num" % 256)) ))
    if [[ $i -gt 0 ]]; then
      mask="$byte_num.$mask"
    else
      mask="$byte_num"
    fi
  mask_num=$((mask_num >> 8))
  done
  echo "$mask"
fi
