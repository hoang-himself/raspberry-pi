#!/usr/bin/env bash

podman container run -d --replace \
  --name registry \
  `#-p 5000:5000` \
  --pod rpi \
  -v "$PWD/config.yml:/etc/docker/registry/config.yml:z" \
  -v 'registry:/var/lib/registry' \
  docker.io/library/registry:latest
