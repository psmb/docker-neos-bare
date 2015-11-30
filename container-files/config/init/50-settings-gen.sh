#!/bin/sh


SETTINGS_SOURCE_FILE="/config/Settings.yaml"
SETTINGS_TARGET_FILE="/data/www/shared/Configuration/Settings.yaml"

T3APP_DB_HOST=${T3APP_DB_HOST:=${DB_PORT_3306_TCP_ADDR:="db"}}
T3APP_DB_PORT=${T3APP_DB_PORT:=${DB_PORT_3306_TCP_PORT:="3306"}}
T3APP_DB_USER=${T3APP_DB_USER:=${DB_ENV_MARIADB_USER:="admin"}}
T3APP_DB_PASS=${T3APP_DB_PASS:=${DB_ENV_MARIADB_PASS:="password"}}
T3APP_DB_NAME="db"

function create_settings_yaml() {
  # Only proceed if file DOES NOT exist...
  if [ -f $SETTINGS_TARGET_FILE ]; then return 0; fi

  mkdir -p $(dirname $SETTINGS_TARGET_FILE)
  cat $SETTINGS_SOURCE_FILE > $SETTINGS_TARGET_FILE
  echo "Configuration file $SETTINGS_TARGET_FILE created."
}

function update_settings_yaml() {
  # Only proeced if file DOES exist...
  if [ ! -f $SETTINGS_TARGET_FILE ]; then return 0; fi

  echo "Configuring $SETTINGS_TARGET_FILE..."
  sed -i -r "1,/dbname:/s/dbname: .+?/dbname: $T3APP_DB_NAME/g" $SETTINGS_TARGET_FILE
  sed -i -r "1,/user:/s/user: .+?/user: $T3APP_DB_USER/g" $SETTINGS_TARGET_FILE
  sed -i -r "1,/password:/s/password: .+?/password: $T3APP_DB_PASS/g" $SETTINGS_TARGET_FILE
  sed -i -r "1,/host:/s/host: .+?/host: $T3APP_DB_HOST/g" $SETTINGS_TARGET_FILE
  sed -i -r "1,/port:/s/port: .+?/port: $T3APP_DB_PORT/g" $SETTINGS_TARGET_FILE

  cat $SETTINGS_TARGET_FILE
  echo "$SETTINGS_TARGET_FILE updated."
}

create_settings_yaml
update_settings_yaml
