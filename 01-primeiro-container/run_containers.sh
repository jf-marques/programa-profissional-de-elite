#!/bin/bash
docker pull nginx
docker run -d -p 80:80 --name meu-servidor nginx:latest
docker container ls
docker container stop $(docker container ls -qa)
docker container rm $(docker container ls -qa)
docker container ls
