# Build image with HashiCorp Vault; specify versions with, e.g.:
# --build-arg from_image=ubuntu:19.04
# --build-arg vault_version=1.2.3

ARG from_image
FROM ${from_image}

ARG vault_version
ARG vault_archive=vault_${vault_version}_linux_amd64.zip
ARG vault_url_base=https://releases.hashicorp.com/vault/${vault_version}
ARG vault_url=${vault_url_base}/${vault_archive}

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl unzip \
  && curl -LO "${vault_url}" \
  && unzip "${vault_archive}" -d /usr/local/bin \
  && vault -autocomplete-install \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
