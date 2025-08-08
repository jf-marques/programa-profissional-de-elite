# Usa uma imagem leve com FFmpeg já instalado
FROM jrottenberg/ffmpeg:5.1-ubuntu

# Define o diretório de trabalho
WORKDIR /app

# Copia o script para o contêiner
COPY convert.sh .

# Permissões de execução
RUN chmod +x convert.sh

# Define ENTRYPOINT como o script
ENTRYPOINT ["./convert.sh"]

# Define CMD padrão (caso nenhum argumento seja passado)
CMD ["sample.mp4", "avi"]