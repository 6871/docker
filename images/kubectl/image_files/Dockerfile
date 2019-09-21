# Build image with kubectl; specify versions with, e.g.:
# --build-arg from_image=6871/ansible:2.8.5
# --build-arg k8s_version=1.15.3

ARG from_image
FROM ${from_image}

ARG k8s_version
ARG k8s_prefix=https://storage.googleapis.com/kubernetes-release/release
ARG k8s_kubectl_suffix=/bin/linux/amd64/kubectl

#  && apt-get install --yes openssh-client sshpass curl vim \
RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl \
  && curl -LO "${k8s_prefix}/${k8s_version}${k8s_kubectl_suffix}" \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \
  && apt-get purge --yes ca-certificates curl \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
