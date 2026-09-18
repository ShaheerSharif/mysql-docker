#!/bin/sh
set -e

valkey-server /etc/valkey/valkey.conf &
SERVER_PID=$!

until valkey-cli ping >/dev/null 2>&1; do
  sleep 0.5
done

valkey-cli ACL SETUSER ">${VALKEY_USER}" on ">${VALKEY_PASSWORD}" '~*' '&*' +@all
valkey-cli ACL SETUSER default off

wait "$SERVER_PID"

