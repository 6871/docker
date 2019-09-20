#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\nUsage: from_image ansible_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local ansible_version="$2"
  local tag="${3:-ansible:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "ansible_version=${ansible_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
