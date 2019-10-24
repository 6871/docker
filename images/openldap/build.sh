#!/usr/bin/env bash

function main() {
  if [[ $# -lt 1 || $# -gt 2 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image [tag]\n'
    return 64
  fi

  local from_image="$1"
  local tag="${2:-openldap:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --tag "${tag}" \
    image_files
}

main "$@"
