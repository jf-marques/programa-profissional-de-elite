# Otimizando para o menor tamanho possível, usada a imagem base nginx:alpine
# Esta imagem já é bastante leve e é ideal para servir conteúdo estático.

FROM nginx:alpine

# Copia os arquivos da pasta 'pagina-institucional' para o diretório
# padrão de arquivos estáticos do NGINX dentro da imagem.
COPY ./pagina-institucional/ /usr/share/nginx/html

# Expor a porta 80, que é a porta padrão que o NGINX usa para servir a página.
# Isso informa ao Docker que o container vai escutar nesta porta.
EXPOSE 80

