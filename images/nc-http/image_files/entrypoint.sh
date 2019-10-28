#!/usr/bin/env bash

printf '%s\n' 'Running nc, NC_HTTP_PORT="%s"...' "${NC_HTTP_PORT}"

while true; do
  printf '%s\n%s\n%s\n\n%s\n%s\n%s' \
    'HTTP/1.1 200 OK' \
    'Content-Type: text/html; charset=UTF-8' \
    'Server: nc' \
    '<!doctype html>' \
    '<html><body><p>Hello, World!</p>' \
    '<p>@ '"$(date)"'</p></body></html>' \
  | nc -l -p "${NC_HTTP_PORT:-8080}" -N
done
