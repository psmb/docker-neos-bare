#!/bin/bash

BASE_URI=${BASE_URI:=${BASE_URI:=""}}
SETTINGS_SOURCE_FILE="/config/Settings.yaml"
SETTINGS_WITH_BASE_URI_SOURCE_FILE="/config/SettingsWithBaseUri.yaml"
SETTINGS_TARGET_FILE="/data/www/shared/Configuration/Settings.yaml"

function create_settings_yaml() {
  # Only proceed if file DOES NOT exist...
  if [ -f $SETTINGS_TARGET_FILE ]; then return 0; fi

  mkdir -p $(dirname $SETTINGS_TARGET_FILE)
  if [[ -z "$BASE_URI" ]]; then
    cat $SETTINGS_SOURCE_FILE > $SETTINGS_TARGET_FILE
    echo "Configuration file $SETTINGS_TARGET_FILE created."
  else
    cat $SETTINGS_WITH_BASE_URI_SOURCE_FILE > $SETTINGS_TARGET_FILE
    sed -i -r "1,/baseUri:/s~baseUri: .+?~baseUri: '$BASE_URI'~g" $SETTINGS_TARGET_FILE
    echo "Configuration file $SETTINGS_TARGET_FILE with baseUri set to $BASE_URI created."
  fi
}

create_settings_yaml
