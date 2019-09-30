#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image jx_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local jx_version="$2"
  local tag="${3:-jx:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "jx_version=${jx_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
