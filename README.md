# Docker Library

## Docker Build Files

### [images/ansible](images/ansible/image_files/Dockerfile)

Adds Ansible to the specified base image.

Base image must be Ubuntu based and have Python installed.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | 6871/python:3.7.4
ansible_version | Version of Ansible to install | 2.8.5

### [images/helm](images/helm/image_files/Dockerfile)

Adds Helm to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
helm_version | Version of Helm to install | v2.14.3

:exclamation: Note "v" prefix in Helm version number.

### [images/kubectl](images/kubectl/image_files/Dockerfile)

Adds kubectl to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
k8s_version | Version of kubectl to install | v1.16.0

:exclamation: Note "v" prefix in Helm version number.

Latest stable kubectl version: [kubernetes-release](https://storage.googleapis.com/kubernetes-release/release/stable.txt)

### [images/python](images/python/image_files/Dockerfile)

Adds Python to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
python_version | Version of Python to install | 3.7.4

:exclamation: Packages are removed at the end of the build to reduce image
size and could impact existing programs in some parent images.

# Pre-built Images

The following pre-built images are available at
[hub.docker.com/r/6871](https://hub.docker.com/r/6871):

## [6871/ansible](https://hub.docker.com/r/6871/ansible/tags)

Version | Built From | Adds
--- | --- | ---
```1.0.0``` ```latest``` | ```6871/python:1.0.0``` | ```ansible 2.8.5```

## [6871/ansible-k8s](https://hub.docker.com/r/6871/ansible-k8s/tags)

Version | Built From | Adds
--- | --- | ---
```1.0.0``` ```latest``` | ```6871/ansible:1.0.0``` | ```helm v2.14.3``` ```kubectl v1.16.0```

## [6871/python](https://hub.docker.com/r/6871/python/tags)

Version | Built From | Adds
--- | --- | ---
```1.0.0``` ```latest``` | ```docker.io/library/ubuntu:18.04``` | ```Python 3.7.4```
