# Build image with nodejs; specify versions with, e.g.:
# --build-arg from_image=ubuntu:20.04
# --build-arg node_version=v12.16.3

ARG from_image
FROM ${from_image}

ARG node_version
ARG node_archive=node-${node_version}-linux-x64.tar.xz
ARG node_url_base=https://nodejs.org/dist/${node_version}
ARG node_url=${node_url_base}/${node_archive}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl \
       tar unzip xz-utils zlib1g-dev \
  && curl -Ls "${node_url}" | tar -C /usr/local/lib -xJ \
  && apt-get purge --yes curl \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/usr/local/lib/node-${node_version}-linux-x64/bin"
