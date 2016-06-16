/#!/usr/bin/env bash

dnf update && dnf install policycoreutils policycoreutils-python checkpolicy git curl
curl -fsSL https://get.docker.com/ | sh
systemctl enable docker
systemctl start docker
groupadd docker
usermod -aG docker root
