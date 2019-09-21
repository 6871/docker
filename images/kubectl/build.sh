#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image k8s_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local k8s_version="$2"
  local tag="${3:-kubectl:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "k8s_version=${k8s_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
