package main

import (
    "fmt"
    "os"
    "os/exec"
)

func main() {
    if len(os.Args) != 3 {
        fmt.Println("Uso: ./app <arquivo de entrada> <formato de saída>")
        os.Exit(1)
    }

    inputFile := os.Args[1]
    outputFormat := os.Args[2]
    outputFile := fmt.Sprintf("output.%s", outputFormat)

    if _, err := os.Stat(inputFile); os.IsNotExist(err) {
        fmt.Printf("Erro: o arquivo '%s' não foi encontrado.\n", inputFile)
        os.Exit(1)
    }

    cmd := exec.Command("ffmpeg", "-i", inputFile, "-preset", "fast", "-c:v", "libx264", "-c:a", "aac", outputFile)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr

    fmt.Printf("Iniciando conversão de %s para %s...\n", inputFile, outputFile)
    if err := cmd.Run(); err != nil {
        fmt.Println("Erro na conversão do arquivo:", err)
        os.Exit(1)
    }

    fmt.Println("Conversão concluída com sucesso!")
}