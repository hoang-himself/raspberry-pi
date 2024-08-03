#!/usr/bin/env bash

podman pod create --replace \
  -p 80:80 \
  -p 443:443 \
  rpi
