# Build Example

To build a single "devops" image with Python, Ansible, kubectl and Helm
installed:

```
# Clone this repository to the current directory
git clone https://github.com/6871/docker.git

# Build interim image 1 from Ubuntu 18.04; install Python 3.7.4
cd docker/images/python
./build.sh ubuntu:18.04 3.7.4 interim-1

# Build interim image 2 from interim image 1; install Ansible 2.8.5
cd ../ansible
./build.sh interim-1 2.8.5 interim-2

# Build interim image 3 from interim image 2; install kubectl v1.16.0
cd ../kubectl
./build.sh interim-2 v1.16.0 interim-3

# Build devops image from interim image 3; install Helm v2.14.3
cd ../helm
./build.sh interim-3 v2.14.3 devops

# Remove interim images
docker rmi interim-3 interim-2 interim-1
```
