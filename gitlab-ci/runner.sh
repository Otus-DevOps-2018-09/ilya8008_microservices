#!/bin/bash
# $1 - number of runners
# $2 - ip address of host
# $3 - registration token
for (( n=1; n<=$1; n++ ))
do
docker run -d --name gitlab-runner-$n --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

docker exec -it gitlab-runner-$n gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-image alpine:latest \
  --url "http://$2" \
  --registration-token "$3" \
  --description "docker-runner-$n" \
  --tag-list "linux,xenial,ubuntu,docker" \
  --run-untagged \
  --locked="false"

done