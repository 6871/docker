Adds Ansible to the specified base image.

Base image must be Ubuntu based and have Python installed.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | 6871/python:1.0.0
ansible_version | Version of Ansible to install | 2.8.5
