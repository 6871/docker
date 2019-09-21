Adds Helm to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
helm_version | Version of Helm to install | v2.14.3

:exclamation: Note "v" prefix in Helm version number.
