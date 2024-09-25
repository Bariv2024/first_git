#!/bin/bash


# Функция для поиска пользователя по имени
check_user_name() {
    local name=$1
    local found=false

    while IFS= read -r line; do 
        if [[ $line == "Имя: $name" ]]; then
            found=true
            echo "Пользователь с именем '$name' уже существует."
            return 1 
        fi
    done < data.txt
    return 0
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
# Функция добавления пользователя
add_user() {

    # Запрашиваем имя у пользователя
    read -p "Введите ваше имя: " name

    if check_user_name "$name"; then { 

        echo "proverka 59" 

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
    }
    fi
}

echo "1. Добавить пользователя - нажмите 1
2. Искать пользователя - нажмите 2"

read -p "Ваш выбор: " choice

if [[ $choice = 1 ]]; then           
    add_user  
elif [[ $choice = 2 ]]; then {
    read -p "Введите имя для поиска: " search_name
    find_user_by_name "$search_name" 
}
else 
    echo "не корректное значение"
fi


 


