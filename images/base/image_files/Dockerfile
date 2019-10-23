# Build image with basic utils; specify versions with, e.g.:
# --build-arg from_image=ubuntu:19.04

ARG from_image
FROM ${from_image}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates \
     curl tar vim less \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
