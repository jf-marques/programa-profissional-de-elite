#!/bin/bash
docker pull nginx
docker run -d -p 80:80 --name meu-servidor nginx:latest
echo "Container em execução, acesse localhost para confirmar se funcionou!"
docker container ls
read -p "Tecle Enter para encerrar"
docker container stop meu-servidor
docker container rm meu-servidor
docker container ls -a
