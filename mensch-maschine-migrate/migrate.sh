#!/bin/bash

H2_URL=$1
DEFAULT_H2_URL="jdbc:h2:tcp://localhost:1521/mensch_maschine"

if [ -z "$H2_URL" ]; then
  read -p "Please inform the JDBC URL ($DEFAULT_H2_URL): " H2_URL
fi

echo "Using JDBC URL: ${H2_URL:=$DEFAULT_H2_URL}"
read -p "Is it correct? [y/n]: " CONFIRMATION

if [ "${CONFIRMATION^^}" = "Y" ]; then
  echo "Starting migrate!"
  mvn flyway:migrate -Dh2.url=$H2_URL

else
  echo "Goodbye then."
fi
