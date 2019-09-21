#!/usr/bin/env bash

function main() {
  if [[ $# -lt 2 || $# -gt 3 ]]; then
    printf 'Invalid arguments\n'
    printf 'Usage: from_image terraform_version [tag]\n'
    return 64
  fi

  local from_image="$1"
  local tf_version="$2"
  local tag="${3:-terraform:latest}"

  docker build \
    --build-arg "from_image=${from_image}" \
    --build-arg "tf_version=${tf_version}" \
    --tag "${tag}" \
    image_files
}

main "$@"
