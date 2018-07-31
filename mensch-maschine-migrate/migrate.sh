#!/bin/bash

H2_URL=$1

if [ -z "$H2_URL" ]; then
  read -p "Please inform the JDBC URL: " H2_URL
fi

echo "Using JDBC URL: $H2_URL"
read -p "Is it correct? [y/n]: " CONFIRMATION

if [ "${CONFIRMATION^^}" = "Y" ]; then
  echo "Starting migrate!"

  mvn flyway:migrate \
    -Dh2.url=$H2_URL \
    -Dh2.user=sa
else
  echo "Goodbye then."
fi
