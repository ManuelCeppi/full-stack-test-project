#!/bin/bash

set -e

echo "migrationsss!"

echo "Running migrations"

DATABASE_URL_TEST_DB=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$DB_HOST:$DB_PORT/test?sslmode=disable
DATABASE_URL=$DATABASE_URL_TEST_DB dbmate --migrations-dir ./migrations --no-dump-schema --wait up

echo "DB mate migrations completed with success"

tail -f /var/log/*

