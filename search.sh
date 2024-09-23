#!/bin/bash

# Функция для проверки валидности номера телефона
validate_phone_number() {
    local phone_number=$1
    local pattern='^8 [0-9]{3} [0-9]{3} [0-9]{2} [0-9]{2}$'
    if [[ $phone_number =~ $pattern ]]; then
        return 0
    else
        return 1
    fi
}

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

# Запрашиваем имя у пользователя
read -p "Введите ваше имя: " name

# Запрашиваем место работы у пользователя
read -p "Введите ваше место работы: " workplace

# Запрашиваем номер телефона у пользователя (в формате 8 ХХХ ХХХ ХХ ХХ)
while true; do
    read -p "Введите ваш номер телефона (в формате 8 ХХХ ХХХ ХХ ХХ): " phone_number
    if validate_phone_number "$phone_number"; then
        break
    else
        echo "Неверный формат номера телефона. Пожалуйста, попробуйте снова."
    fi
done

# Запрашиваем имя для поиска
read -p "Введите имя для поиска: " search_name

# Ищем пользователя по имени и выводим информацию
find_user_by_name "$search_name"


