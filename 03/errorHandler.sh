#!/bin/bash

REGEX="^[1-6]$"

errorHandler(){
if [[ $# -ne 4 ]]; then
  echo "Error! Script takes 4 arguments! Try again!" >&2
elif ! [[ $1 =~ $REGEX ]] || ! [[ $2 =~ $REGEX ]] \
  || ! [[ $3 =~ $REGEX ]] || ! [[ $4 =~ $REGEX ]] ; then
  echo "Error! Invalid arguments.The parameters must be numeric, from 1 to 6. Try again!" >&2
elif [[ $1 == "$2" ]] || [[ $3 == "$4" ]]; then
  echo "Error! The font and background colours of one column must not match. Try again!" >&2
else
  return 0
fi
echo "Explanation:
Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
Parameter 3 is the background of the values (after the '=' sign)
Parameter 4 is the font colour of the values (after the '=' sign)." >&2
return 1
}
