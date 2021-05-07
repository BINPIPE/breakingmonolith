#!/usr/bin/env sh

sleep 13
# Import data sources
for file in *-datasource.json; do
  if [ -e "$file" ]; then
    echo "importing $file" &&
    curl --silent --fail --show-error \
      --request POST http://admin:admin@MyGrafana:3000/api/datasources \
      --header "Content-Type: application/json" \
      --header "Accept: application/json" \
      --data-binary "@$file";
    echo "";
  fi
done;

# Import dashboards
for file in *-dashboard.json; do
  if [ -e "$file" ]; then
    echo "importing $file" &&
    curl -v --request POST http://admin:admin@MyGrafana:3000/api/dashboards/import \
      --header "Content-Type: application/json" \
      --header "Accept: application/json" \
      --data-binary "@$file";
    echo "";
  fi
done;
