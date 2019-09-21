Adds Python to the specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:18.04
python_version | Version of Python to install | 3.7.4

:exclamation: Package removal to reduce image size may impact some parent
images.
