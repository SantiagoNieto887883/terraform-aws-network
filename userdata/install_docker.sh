#!/bin/bash
until yum update -y; do
  echo "Waiting for yum repositories..."
  sleep 10
done
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user