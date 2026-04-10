#!/bin/bash

if [ "$1" == "add" ] && [ -n "$2" ]; then
    echo "$2" >> tasks.txt
    echo "Task added: $2"
fi
    echo " "
if [[ -f "tasks.txt" ]]; then
        echo "My To-Do List:"
        cat -n "tasks.txt"
fi

echo ""

arg=$2

if [ "$1" == "del" ]; then
    if sed -n "${arg}p" "tasks.txt" | grep -q .; then
        sed -i "${arg}d" "tasks.txt"
        echo -e "\e[32m Task $arg deleted successfully.\e[0m"
    
    else

        echo -e "\e[31m Error: Task number $arg does not exist.\e[0m"

    fi
fi