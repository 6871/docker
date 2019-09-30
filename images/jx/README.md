Adds jx command ([Jenkins X](https://github.com/jenkins-x/jx/releases)) to the
specified base image.

Base image must be Ubuntu based.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | 6871/k8s:1.0.1
jx_version | Version of Jenkins X to install | v2.0.802

:exclamation: Note "v" prefix in jx_version number.

---

https://jenkins-x.io/docs/managing-jx/old/install-on-cluster/#installing-jenkins-x-on-premises

```shell script
# Consider using a copy of kubeconfig as jx updates it
kc_file=

# Can't use ",readonly" on mount of kubeconfig file
docker run --rm --interactive --tty  \
  --mount "type=bind,source=$kc_file,target=/root/.kube/config" \
  jx:latest \
  jx install --provider=kubernetes --on-premise
```

Jenkins X Observations:

- Have to install and run Jenkins X installer program to install Jenkins X?
  - No Helm chart install? 
- Install requires and updates kubeconfig file
- Has to be integrated to github (e.g. gitlab support listed as "pending")?
