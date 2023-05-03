#!/bin/bash

REGEX="^[1-6]$"

COLOR="\033[1;40;31m"
NO_COLOR="\033[0m"

errorHandler(){
if [[ $# -ne 4 ]]; then
  echo "Error! Script takes 4 arguments! Try again!" >&2
elif ! [[ $1 =~ $REGEX ]] || ! [[ $2 =~ $REGEX ]] \
  || ! [[ $3 =~ $REGEX ]] || ! [[ $4 =~ $REGEX ]] ; then
  echo -e "Error! Invalid arguments.The parameters must be numeric, from 1 to 6. Check parameters in ${COLOR}settings.conf${NO_COLOR} and try again!" >&2
elif [[ $1 == "$2" ]] || [[ $3 == "$4" ]]; then
  echo -e "Error! The font and background colours of one column must not match. Check parameters in ${COLOR}settings.conf${NO_COLOR}, default parameters and try again!" >&2
else
  return 0
fi
echo -e "Explanation of parameters in configuration file:
Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
${COLOR}column1_background${NO_COLOR} is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
${COLOR}column1_font_color${NO_COLOR} is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
${COLOR}column2_background${NO_COLOR} is the background of the values (after the '=' sign)
${COLOR}column2_font_color${NO_COLOR} is the font colour of the values (after the '=' sign).

If one or more parameters are not set in the configuration file, the colour will be substituted from the default colour scheme.
Default parameters:
${COLOR}column 1 background${NO_COLOR} = default (black)
${COLOR}column 1 font_color${NO_COLOR} = default (red)
${COLOR}column 2 background${NO_COLOR} = default (black)
${COLOR}column 2 font_color${NO_COLOR} = default (blue)
" >&2
return 1
}
