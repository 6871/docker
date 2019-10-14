#!/usr/bin/env bash

drone_server_host_ip=""
drone_server_host="${drone_server_host_ip}:80"

docker run --rm --detach \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --publish 3000:3000 \
  --env DRONE_LOGS_PRETTY=true \
  --env DRONE_RUNNER_CAPACITY=2 \
  --env DRONE_RPC_PROTO=http \
  --env DRONE_RPC_HOST=${drone_server_host} \
  --env DRONE_RPC_SECRET=0abc5dfba316281d4270711d30e982ee \
  --name runner \
  drone/agent:1
