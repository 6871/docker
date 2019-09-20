# Build Python image; specify versions with, e.g.:
# --build-arg from_image=ubuntu:18.04
# --build-arg python_version=3.7.4

ARG from_image
FROM ${from_image}

ARG python_version
ARG python_archive=Python-${python_version}.tar.xz
ARG python_url_base=https://www.python.org/ftp/python
ARG python_url=${python_url_base}/${python_version}/${python_archive}
ARG python_tmp_dir=/python_tmp

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes curl gcc make libffi-dev libssl-dev unzip \
    xz-utils zlib1g-dev \
  && mkdir python_tmp \
  && curl -Ls "${python_url}" | tar -C "${python_tmp_dir}" -xJ \
  && cd "${python_tmp_dir}/Python-${python_version}" \
  && ./configure \
  && make \
  && make install \
  && pip3 install --upgrade pip \
  && cd / \
  && rm -rf "${python_tmp_dir}" \
  && apt-get purge --yes curl xz-utils gcc make libssl-dev libffi-dev \
    zlib1g-dev \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && find /usr/local/lib/python* -maxdepth 2 -type d -name test \
    | while read -r i; do rm -rfv "$i"; done \
  && rm -rf /var/lib/apt/lists/*
