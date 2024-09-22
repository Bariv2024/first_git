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

# Добавляем данные в файл data.txt
{
    echo "Имя: $name"
    echo "Место работы: $workplace"
    echo "Номер телефона: $phone_number"
    echo ""
} >> data.txt

echo "Данные успешно сохранены в файл data.txt"