#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image helm_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local helm_version="$2"
  local tag="${3:-helm:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "helm_version=${helm_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
