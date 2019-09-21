Adds Terraform to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
tf_version | Version of Terraform to install | 0.12.9
