#!/bin/bash

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
