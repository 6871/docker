Serve a test web page using nc.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:19.04

---

```shell script
./build.sh ubuntu:19.10
docker build --build-arg "from_image=ubuntu:19.10" --tag "nc-http:latest" .
docker run --name nc-http --detach --publish 8080:8080 nc-http
docker run --name nc-http --detach --env NC_HTTP_PORT=8888 --publish 8888:8888 nc-http
docker logs -f nc-http
docker rm -fv nc-http
```
