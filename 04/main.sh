#!/bin/bash

if source errorHandler.sh && source chooseColor.sh; then

  if ! source settings.conf; then
    echo -e "Error! Wrong format of configuration file or configuration file doesn't exist. Check \033[31msettings.conf\033[0m file" >&2
    exit 1
  fi

  if [[ $# -eq 0 ]]; then
    COLORS=$(chooseColors "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color")
    if errorHandler $COLORS; then
      BASH_COLORS="$(replaceColors $COLORS)"
      chmod +x printInfo.sh
      ./printInfo.sh $BASH_COLORS
      echo
      printColors "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color" $COLORS
    fi
  else
    echo "Wrong number of parameters. The script runs without parameters!" >&2
  fi
fi

