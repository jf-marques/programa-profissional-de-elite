#!/bin/bash
docker pull nginx
docker run -d -p 80:80 --name meu-servidor nginx:latest
docker container ls
docker container stop meu-servidor
docker container rm meu-servidor
docker container ls
