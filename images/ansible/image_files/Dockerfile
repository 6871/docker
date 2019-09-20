# Build Ansible image; specify versions with, e.g.:
# --build-arg from_image=6871/python:3.7.4
# --build-arg ansible_version=2.8.5

ARG from_image
FROM ${from_image}

ARG ansible_version

RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes openssh-client sshpass curl vim less \
  && pip3 install --upgrade pip \
  && pip3 --no-cache-dir install --compile ansible==${ansible_version} \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && find /usr/local/lib/python* -maxdepth 2 -type d -name test \
    | while read -r i; do rm -rfv "$i"; done \
  && rm -rf /var/lib/apt/lists/*
