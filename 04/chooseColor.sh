#!/bin/bash

chooseColors(){
if [[ $# -eq 4 ]]; then
  VAR_DEF_VALUES=(6 2 6 4)
  declare -a VAR_VALUES
  i=0
  for ARG in "$@"
  do
    if [[ -z $ARG ]]; then
      VAR_VALUES[i]=${VAR_DEF_VALUES[i]}
    else
      VAR_VALUES[i]=$ARG
    fi
  i=$((i+1))
  done
  echo "${VAR_VALUES[@]}"
fi
}


replaceColors(){
 for VAR in "$@"
 do
 case $VAR in
 1) REPLACED_COLORS+="7 " ;;
 2) REPLACED_COLORS+="1 " ;;
 3) REPLACED_COLORS+="2 " ;;
 4) REPLACED_COLORS+="6 " ;;
 5) REPLACED_COLORS+="5 " ;;
 6) REPLACED_COLORS+="0 ";;
 esac  
 done
 echo "$REPLACED_COLORS"
}


printColors(){
  if [[ $# -eq 8 ]]; then
    ARR_VAR_NAMES=("Column 1 background" "Column 1 font color" "Column 2 background" "Column 2 font color")
    ARR_COLOR_NAMES=(white red green blue purple black)
    ARR_SET_VALUES=("$1" "$2" "$3" "$4")
    ARR_USED_VALUES=("$5" "$6" "$7" "$8")
    i=0
    for VAL in "${ARR_SET_VALUES[@]}"
    do
      if [[ -z $VAL ]]; then
        VAL="default"
      fi
      printf "%s = %s (%s)\n" "${ARR_VAR_NAMES[$i]}" $VAL "${ARR_COLOR_NAMES[${ARR_USED_VALUES[$i]} - 1]}"
      i=$((i+1))
    done
    fi
}

