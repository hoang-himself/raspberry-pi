#!/usr/bin/env bash

podman container run -d --replace \
  --name swag \
  -p 80:80 -p 443:443 \
  --cap-add=NET_ADMIN \
  -e URL=hoang-himself.dev \
  -e VALIDATION=dns \
  -e SUBDOMAINS=status,rpi,registry,syncyomi \
  -e DNSPLUGIN=porkbun \
  -e ONLY_SUBDOMAINS=true \
  -v "$PWD/config:/config:z" \
  lscr.io/linuxserver/swag:latest
