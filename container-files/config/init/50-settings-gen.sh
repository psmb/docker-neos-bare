#!/bin/bash

SETTINGS_SOURCE_FILE="/config/Settings.yaml"
SETTINGS_TARGET_FILE="/data/www/shared/Configuration/Settings.yaml"

function create_settings_yaml() {
  # Only proceed if file DOES NOT exist...
  if [ -f $SETTINGS_TARGET_FILE ]; then return 0; fi

  mkdir -p $(dirname $SETTINGS_TARGET_FILE)
  cat $SETTINGS_SOURCE_FILE > $SETTINGS_TARGET_FILE
  echo "Configuration file $SETTINGS_TARGET_FILE created."
}

create_settings_yaml
