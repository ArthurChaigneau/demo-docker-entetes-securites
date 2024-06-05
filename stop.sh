#!/bin/bash

# Stop and remove Docker containers for each scenario

docker stop docker-xframe
docker rm docker-xframe

docker stop docker-csp
docker rm docker-csp

docker stop docker-hsts
docker rm docker-hsts

docker stop docker-mime
docker rm docker-mime

docker stop docker-referrer
docker rm docker-referrer

docker stop docker-feature
docker rm docker-feature
echo "Docker containers stopped and removed successfully."
