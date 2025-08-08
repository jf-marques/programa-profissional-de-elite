# Etapa 1: Build da imagem
FROM python:3.11-slim AS base

# Evita prompts interativos
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100

# Instala dependências do sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Apenas os arquivos de dependência para permitir cache
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
