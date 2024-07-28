#!/usr/bin/env bash

podman container run -d --replace \
  --name ddns-updater \
  `#-p 8000:8000` \
  --pod rpi \
  -v "$PWD/data:/updater/data:z" \
  ghcr.io/qdm12/ddns-updater:latest
