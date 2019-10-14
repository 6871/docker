#!/usr/bin/env bash

gitlab_host_ip=""
gitlab_server="http://${gitlab_host_ip}"
gitlab_oauth_client_id=""
gitlab_oauth_client_secret=""
drone_server_host_ip=""
drone_server_host="${drone_server_host_ip}:80"

docker run --rm --detach \
  --mount "type=volume,source=drone_data,target=/data" \
  --publish 80:80 \
  --env DRONE_LOGS_PRETTY=true \
  --env DRONE_GITLAB_SERVER=http://${gitlab_server} \
  --env DRONE_GITLAB_CLIENT_ID=${gitlab_oauth_client_id} \
  --env DRONE_GITLAB_CLIENT_SECRET=${gitlab_oauth_client_secret} \
  --env DRONE_SERVER_HOST=${drone_server_host} \
  --env DRONE_SERVER_PROTO=http \
  --env DRONE_RPC_SECRET=0abc5dfba316281d4270711d30e982ee \
  drone/drone:1 \
  /root/go/bin/drone-server
