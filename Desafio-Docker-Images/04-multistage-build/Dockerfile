# Etapa 1: build com Go
FROM golang:1.22 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Compila o binário principal
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app converter.go

# Etapa 2: imagem final (leve, com ffmpeg)
FROM alpine:latest

RUN apk add --no-cache ffmpeg

WORKDIR /app

# Copia apenas o binário
COPY --from=builder /app/app .

# Define entrada padrão
ENTRYPOINT ["./app"]
CMD ["video.mp4", "avi"]
