Adds kubectl to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
k8s_version | Version of kubectl to install | v1.16.0

:exclamation: Note "v" prefix in Helm version number.

Latest stable kubectl version: [kubernetes-release](https://storage.googleapis.com/kubernetes-release/release/stable.txt)
