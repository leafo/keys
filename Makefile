CURRENT_DB=$(shell luajit -e 'print(require("lapis.config").get().postgres.database)')


schema.sql::
	pg_dump -s -U postgres selfwatch_keys > schema.sql
	pg_dump -a -t lapis_migrations -U postgres selfwatch_keys >> schema.sql

init_schema::
	createdb -U postgres selfwatch_keys
	cat schema.sql | psql -U postgres selfwatch_keys

# copy dev db schema into test db
test_db::
	-dropdb -U postgres selfwatch_keys_test
	createdb -U postgres selfwatch_keys_test
	pg_dump -s -U postgres $(CURRENT_DB) | psql -U postgres selfwatch_keys_test
	pg_dump -a -t lapis_migrations -U postgres $(CURRENT_DB) | psql -U postgres selfwatch_keys_test
