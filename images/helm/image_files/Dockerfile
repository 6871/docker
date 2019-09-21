# Build image with Helm; specify versions with, e.g.:
# --build-arg from_image=6871/ansible:2.8.5
# --build-arg helm_version=1.15.3

ARG from_image
FROM ${from_image}

ARG helm_version
ARG helm_archive=helm-${helm_version}-linux-amd64.tar.gz
ARG helm_url=https://get.helm.sh/${helm_archive}
ARG helm_tmp_dir="${HOME}/helm_tmp"

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes curl \
  && curl -LO "${helm_url}" \
  && mkdir "${helm_tmp_dir}" \
  && tar -C "${helm_tmp_dir}" -zxvf "${helm_archive}" \
  && rm "${helm_archive}" \
  && mv "${helm_tmp_dir}/linux-amd64/helm" /usr/local/bin/helm \
  && rm -rf "${helm_tmp_dir}" \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
