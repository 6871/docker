#!/usr/bin/env bash

function main() {
  if [[ $# -lt 1 || $# -gt 2 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image [graphql_version] [tag]\n'
    return 64
  fi

  local from_image="$1"
  local graphql_version="$2"
  local tag="${3:-node-apollo-server:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "graphql_version=${graphql_version}" \
    --tag "${tag}" \
    image_files

  printf 'docker run --interactive --tty --rm --name test %s\n' "${tag}"
}

main "$@"
