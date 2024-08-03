#!/usr/bin/env bash

podman container run -d --replace \
  --name syncyomi \
  -p 8282:8282 \
  -v "$PWD/config:/config:z" \
  ghcr.io/syncyomi/syncyomi:latest
