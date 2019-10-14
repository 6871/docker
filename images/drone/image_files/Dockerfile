# Build image with Drone; specify versions with, e.g.:
# --build-arg from_image=ubuntu:18.04
# --build-arg drone_version=v1.5.1

ARG from_image
FROM ${from_image}

ARG drone_version
ARG drone_url=https://github.com/drone/drone.git

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl tar \
    git \
  && apt-get install --yes gcc \
  && git clone "${drone_url}" \
  && cd drone \
  && git checkout "${drone_version}" \
  && go install -tags "nolimit" github.com/drone/drone/cmd/drone-agent \
  && go install -tags "nolimit" github.com/drone/drone/cmd/drone-controller \
  && go install -tags "nolimit" github.com/drone/drone/cmd/drone-server \
  && cd .. \
  && rm -rf drone \
  && apt-get purge --yes gcc git \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
