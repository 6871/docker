# Build image with go; specify versions with, e.g.:
# --build-arg from_image=ubuntu:18.04
# --build-arg go_version=1.13.1

ARG from_image
FROM ${from_image}

ARG go_version
ARG go_archive=go${go_version}.linux-amd64.tar.gz
ARG go_url_base=https://dl.google.com/go
ARG go_url=${go_url_base}/${go_archive}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl tar \
  && curl -L "${go_url}" | tar -C /usr/local -xzv \
  && apt-get purge --yes curl \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/usr/local/go/bin"
