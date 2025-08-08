docker volume create nginx_logs docker volume ls docker volume inspect nginx_logs docker volume rm nginx_logs

docker container run -d -p 8080:80 --mount type=volume,source=nginx_logs,target=/var/log/nginx nginx:latest

ou

docker container run -d -p 8080:80 -v nginx_logs:/var/log/nginx nginx:latest

cd /mnt/c/Users/jf-ma/programa-profissional-de-elite/