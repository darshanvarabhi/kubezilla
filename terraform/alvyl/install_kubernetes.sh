#!bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo hostnamectl set-hostname "${server_name}"

curl -sSL https://get.docker.com/ | sh

sudo docker run -d --privileged --restart=unless-stopped \
  --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.4.5 \
  --server https://139.59.51.88 --token v4lqhz4x9msbx8zx7jkz7swbcqxltx9w9jrg59hwngtvgqxwhvqhjs \
  --ca-checksum aa504f82a9e75259dd45a9d65e13d094899921fbbe7e1fc9a1daa721f5fefc8d --worker \
  --label node=cloud \
  --label name="${server_name}"

