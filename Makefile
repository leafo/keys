
schema.sql::
	pg_dump -s -U postgres selfwatch_keys > schema.sql
	pg_dump -a -t lapis_migrations -U postgres selfwatch_keys >> schema.sql

init_schema::
	createdb -U postgres selfwatch_keys
	cat schema.sql | psql -U postgres selfwatch_keys
