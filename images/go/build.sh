#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image go_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local go_version="$2"
  local tag="${3:-go:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "go_version=${go_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
