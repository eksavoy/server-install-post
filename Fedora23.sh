/#!/usr/bin/env bash

dnf update && dnf install policycoreutils policycoreutils-python checkpolicy git curl iptables-services && dnf remove docker
systemctl disable firewalld && systemctl stop firewalld && systemctl unmask firewalld
systemctl enable iptables.service && systemctl start iptables.service
curl -fsSL https://get.docker.com/ | sh
iptables -t filter -N DOCKER
systemctl enable docker
systemctl start docker
groupadd docker
usermod -aG docker root
