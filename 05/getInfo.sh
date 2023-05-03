#!/bin/bash

get_top_file_list() {
  [[ $# -gt 2 ]] || [[ $# -eq 0 ]] && return 1
  [[ $# -eq 2 ]] && [[ $2 -eq "exec" ]] &&  EXEC_FLAG="-executable"
  FILES=$(find "$1" -mindepth 1 -type f $EXEC_FLAG -printf "%s %p\n" | sort -rn | head -n 10 )
  local TOP_FILES_LIST=$(cat <<< "$FILES" | cut -d ' ' -f 2-)
  i=1
  while read -r file && [[  -n $file ]]
  do
    size="$(echo "$(stat -c %s "$file" | numfmt --to=iec)B"| tr , . | sed -re 's/[KMGT]?B/ &/g')"
    if [[ -n $EXEC_FLAG ]]; then
      FILE_INFO="$(md5sum "$file" | awk '{print $1}')"
    else
      FILE_INFO="$(echo "$file" | awk -F/ '{print $NF}' | awk -F. '{ if (NF > 1)
                                              printf("%s\n", $NF)
                                            else
                                              printf("no extension\n") }')"
    fi
    line="$i - ${file}, $size, $FILE_INFO"
    echo "$line"
    i=$((i+1))
  done < <(cat <<< "$TOP_FILES_LIST")
}

TOTAL_FOLDERS_NUM="$(find "$1" -mindepth 1 -type d| wc -l)"
TOP_FOLDERS="$(du -h "$1" | sort -hr | head -n 6 | awk '{if (FNR>1 && FNR<=6 && FNR<=NR){ sub(/,/,".",$1); sub(/[KMGT]/, " &", $1); printf("%i - %s/, %sB\n", (FNR-1), $2, $1)}}')"
TOTAL_FILES_NUM="$(find "$1" -mindepth 1 -type f| wc -l)"
CONF_FILES_NUM="$(find "$1" -mindepth 1 -type f -iname "*.conf"| wc -l)"
FILES=$(find "$1" -mindepth 1 -type f)
TEXT_FILES_NUM=0
for file in $FILES
do
  if file "$file" | grep -q text; then
	  TEXT_FILES_NUM=$(("$TEXT_FILES_NUM"+1))
  fi
done
EXEC_FILES_NUM="$(find "$1" -mindepth 1 -executable -type f| wc -l)"
LOG_FILES_NUM="$(find "$1" -mindepth 1 -type f -iname "*.log"| wc -l)"
ARCH_FILES_NUM="$(find "$1" -type f -iname "*.tar" -o -iname "*.gzip" -o -iname "*.gz" -o -iname "*.bz2" -o -iname "*.zip" -o -iname "*.7z" -o -iname "*.iso" -o -iname "*.rar" | wc -l)"
SYMBOL_LINKS_FILES_NUM="$(find "$1" -mindepth 1 -type l| wc -l)"
TOP_FILES="$(get_top_file_list "$1")"
TOP_EXEC_FILES="$(get_top_file_list "$1" exec)"


