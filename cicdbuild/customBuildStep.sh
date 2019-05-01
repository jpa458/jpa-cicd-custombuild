#!/bin/bash -xe
echo Building custom steps!

docker-credential-gcr configure-docker

docker network create mynet

docker run -d --name myserver --net mynet gcr.io/jpa-cicd-custombuild/hello-node-server:latest

docker run --net mynet gcr.io/jpa-cicd-custombuild/hello-node-client:latest -s http://myserver:8080

