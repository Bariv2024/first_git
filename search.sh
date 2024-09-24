#!/bin/bash

# Функция для поиска пользователя по имени
find_user_by_name() {
    local name=$1
    local found=false

    while IFS= read -r line; do
        if [[ $line == "Имя: $name" ]]; then
            found=true
            echo "$line"
            read -r line
            echo "$line"
            read -r line
            echo "$line"
            break
        fi
    done < data.txt

    if ! $found; then
        echo "Пользователь с именем '$name' не найден."
    fi
}

# Запрашиваем имя для поиска
read -p "Введите имя для поиска: " search_name

# Ищем пользователя по имени и выводим информацию
find_user_by_name "$search_name"


