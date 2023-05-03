#!/bin/bash

if source errorHandler.sh && source replaceColors.sh && errorHandler "$@"; then
  COLORS="$(replaceColors "$@")"
  chmod +x printInfo.sh
  ./printInfo.sh $COLORS
fi


