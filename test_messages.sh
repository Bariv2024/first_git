#!/bin/bash

# Директория, в которой будет производиться поиск файлов
SEARCH_DIR="/home/iib/messages"

# Найти все файлы, соответствующие шаблону messages-XXXXXXXX
FILES=$(find "$SEARCH_DIR" -type f -name "messages-*")

# Проверить, найдены ли файлы
if [ -z "$FILES" ]; then
  echo "Файлы не найдены."
  exit 1
fi

# Извлечь нужные строки и записать их в выходной файл
for FILE in $FILES; do
    grep -E 'SUCCESS LOGIN by' "$FILE" | while IFS= read -r LINE; do
    # Извлечь время и имя пользователя
    temp=$(echo "$LINE" | awk '{print $6}')
    data=$(echo "$LINE" | awk '{print $3, $14, $15}') 
    #echo " $temp "
    echo "$data" >> logins_$temp.txt
  done
done

echo "Содержимое файлов успешно обработано и записано в соответствующие файлы."

