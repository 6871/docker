# Build image with OpenLDAP; specify versions with, e.g.:
# --build-arg from_image=ubuntu:19.04

ARG from_image
FROM ${from_image}

COPY reconfigure.sh /usr/local/bin/reconfigure.sh

RUN apt-get update \
  && apt-get upgrade --yes \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install --yes --no-install-recommends ca-certificates \
     curl tar vim less ldap-utils slapd \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
