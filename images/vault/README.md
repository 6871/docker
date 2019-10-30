Adds Vault to the specified base image.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:19.10
vault_version | Version of Vault to install | 1.2.3

---

Example usage:

```shell script
./build.sh ubuntu:19.10 1.2.3

. <(curl -Ls https://raw.githubusercontent.com/6871/scripts/master/bash/ip_utils.sh)
host=$(ip_list 192.168)

docker run \
  --detach \
  --name vault-dev \
  --publish 8200:8200 \
  --env VAULT_API_ADDR="http://${host}:8200" \
  vault:latest \
  vault server \
  -dev \
  -dev-root-token-id="vault" \
  -dev-listen-address=0.0.0.0:8200
```

- http://localhost:8200 (login token is "vault" from above)

```shell script
docker rm -fv vault-dev
```

---

- [Vault releases](https://github.com/hashicorp/vault/releases)
