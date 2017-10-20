#!/bin/sh

USER=${KEYS_USER:-"leaf_selfspy"}
PASSWORD=${KEYS_PASSWORD:?"Missing password"}
DATABASE=${KEYS_DATABASE:-"leaf_selfspy"}
TABLE=${KEYS_TABLE:-"keys2"}

ssh leaf@leafo.net "mysqldump -u $USER -p$PASSWORD $DATABASE $TABLE --compatible=postgresql --no-data" > backup_schema.sql

for machine_id in $(seq 1 4); do
	echo "Machine ID $machine_id"
	ssh leaf@leafo.net "mysqldump -u $USER -p$PASSWORD $DATABASE $TABLE --where=\"machine_id=$machine_id\" --compatible=postgresql --no-create-info | gzip" | pv >  machine$machine_id.sql.gz
done

