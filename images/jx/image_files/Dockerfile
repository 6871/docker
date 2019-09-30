# Build image with jx (Jenkins X); specify versions with, e.g.:
# --build-arg from_image=6871/k8s:1.0.1
# --build-arg jx_version=v2.0.802

ARG from_image
FROM ${from_image}

ARG jx_version
ARG jx_archive=jx-linux-amd64.tar.gz
ARG jx_url_base=https://github.com/jenkins-x/jx/releases/download
ARG jx_url=${jx_url_base}/${jx_version}/${jx_archive}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl tar \
    git \
  && curl -L "${jx_url}" | tar xzv \
  && mv jx /usr/local/bin \
  && apt-get purge --yes curl \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
