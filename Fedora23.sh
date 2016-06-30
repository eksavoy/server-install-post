/#!/usr/bin/env bash

dnf update && dnf install policycoreutils policycoreutils-python checkpolicy git curl iptables-services && dnf remove docker
systemctl disable firewalld && systemctl stop firewalld && systemctl unmask firewalld
systemctl enable iptables.service && systemctl start iptables.service
curl -fsSL https://get.docker.com/ | sh
iptables -t filter -N DOCKER #https://github.com/docker/docker/issues/16816
systemctl enable docker
systemctl start docker
groupadd docker
usermod -aG docker root
iptables-save >> /etc/sysconfig/iptables

yum install -y yum-utils && rpm --import "https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e" && yum-config-manager --add-repo https://packages.docker.com/1.11/yum/repo/main/centos/7 &&  dnf  install -y --best --allowerasing docker-engine docker-engine-selinux
