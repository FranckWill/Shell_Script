#!/bin/bash

# Caminho onde as pastas serão criadas
base_path="/home/202112160017@ifto.local/PastasAurelio"

# Caminho para o arquivo de dicionário
dictionary_file="Dicionario.txt"

# Lê o conteúdo do arquivo de dicionário em um array
mapfile -t dictionary < "$dictionary_file"

# Função para gerar um índice aleatório
generate_random_index() {
  echo $((RANDOM % ${#dictionary[@]}))
}

# Loop para criar as pastas
for ((i = 1; i <= 5000; i++)); do
  # Escolher um nome aleatório do dicionário
  random_name_index=$(generate_random_index)
  folder_name=${dictionary[random_name_index]}

  # Caminho completo da pasta
  folder_path="$base_path/$folder_name-$i"

  # Criar a pasta
  mkdir -p "$folder_path"

  # Definir permissões apenas de leitura (444)
  chmod 444 "$folder_path"
done

echo "Criação das pastas concluída."
