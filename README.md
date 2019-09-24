# Docker Image Build Library

The following Docker image build modules are provided:

- [ansible](images/ansible)
- [helm](images/helm)
- [kubectl](images/kubectl)
- [python](images/python)
- [terraform](images/terraform)

Pre-built images can be found here:
[https://hub.docker.com/u/6871](https://hub.docker.com/u/6871)

## Build Example

To build a "devops" image with Python, Ansible, kubectl and Helm installed:

```
git clone https://github.com/6871/docker.git
cd docker/images/python
./build.sh ubuntu:18.04 3.7.4 interim-1
cd ../ansible
./build.sh interim-1 2.8.5 interim-2
cd ../kubectl
./build.sh interim-2 v1.16.0 interim-3
cd ../helm
./build.sh interim-3 v2.14.3 devops
docker rmi interim-3 interim-2 interim-1
```
