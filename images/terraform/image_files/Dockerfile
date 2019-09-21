# Build image with terraform; specify versions with, e.g.:
# --build-arg from_image=6871/ansible:1.0.0
# --build-arg tf_version=0.12.6

ARG from_image
FROM ${from_image}

ARG tf_version
ARG tf_zip=terraform_${tf_version}_linux_amd64.zip
ARG tf_url=https://releases.hashicorp.com/terraform/${tf_version}/${tf_zip}

#  && apt-get install --yes openssh-client sshpass curl vim \
RUN apt-get update \
  && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends \
    ca-certificates curl unzip \
  && curl -LO "${tf_url}" \
  && unzip "${tf_zip}" \
  && rm -fv "${tf_zip}" \
  && mv terraform /bin/ \
  && apt-get purge --yes ca-certificates curl unzip \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*
