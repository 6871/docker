# Build image with Concourse; specify versions with, e.g.:
# --build-arg from_image=ubuntu:18.04
# --build-arg concourse_version=5.6.0

ARG from_image
FROM ${from_image}

ARG concourse_version
ARG fly_archive=fly-${concourse_version}-linux-amd64.tgz
ARG fly_url_base=https://github.com/concourse/concourse/releases/download
ARG fly_url=${fly_url_base}/v${concourse_version}/${fly_archive}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl tar \
  && curl -L "${fly_url}" | tar -C /usr/local/bin -xzv \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
