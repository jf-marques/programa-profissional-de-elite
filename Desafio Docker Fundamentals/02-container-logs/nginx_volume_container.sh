#!/bin/bash

# Cria o volume para logs
docker volume create nginx_logs

# Sobe o container com o volume montado
# docker container run -d -p 8080:80 -v nginx_logs:/var/log/nginx nginx:latest
# ou
docker container run -d -p 8080:80 \
  --name=meu-nginx \
  --mount type=volume,source=nginx_logs,target=/var/log/nginx \
  nginx:latest

# Aguarda o Nginx subir
sleep 4

# Cria o arquivo diretamente dentro do container (no volume montado)
docker exec meu-nginx sh -c 'echo "Teste de persistência de arquivo em um container deletado." > /var/log/nginx/arquivo.txt'

# Mostrando o arquivo
echo -e "\n--- Arquivo criado ---"
docker exec meu-nginx cat /var/log/nginx/arquivo.txt

# Parando e removendo o container
docker rm -f meu-nginx

# Subindo novo container com o mesmo volume
docker container run -d -p 8080:80 \
  --name=meu-nginx \
  --mount type=volume,source=nginx_logs,target=/var/log/nginx \
  nginx:latest

# Aguarda subir novamente
sleep 2

# Exibe o arquivo antigo novamente
echo -e "\n--- Conferindo se o arquivo antigo ainda existe ---"
docker exec meu-nginx cat /var/log/nginx/arquivo.txt



