#!/bin/bash

printList(){
  if [[ $# -lt 2 ]]; then
    if [[ $# -eq 1 ]] && [[ -n "$1" ]]; then
      cat <<< "$1"
    else
      echo "no files founded"
    fi
  fi
}


if ! source getInfo.sh; then
  echo "Something wrong in getInfo.sh. Check and try again!" >&2
  exit 1
fi
echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS_NUM"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
printList "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES_NUM"
echo "Number of: "
echo "Configuration files (with the .conf extension) = $CONF_FILES_NUM"
echo "Text files = $TEXT_FILES_NUM"
echo "Executable files = $EXEC_FILES_NUM"
echo "Log files (with the extension .log) = $LOG_FILES_NUM"
echo "Archive files = $ARCH_FILES_NUM"
echo "Symbolic links = $SYMBOL_LINKS_FILES_NUM"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
printList "$TOP_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
printList "$TOP_EXEC_FILES"

