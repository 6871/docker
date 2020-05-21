#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image node_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local node_version="$2"
  local tag="${3:-node:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "node_version=${node_version}" \
    --tag "${tag}" \
    image_files

  echo 'docker run --interactive --tty --rm --name node node:latest'
}

main "$@"
