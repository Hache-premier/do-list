#!/bin/bash
if [ "$1" == "add" ]; then

  if [ -n "$2" ]; then

    if grep -Fxq "$2" tasks.txt 2>/dev/null; then
      echo "Task already exists in the list."
    else
      echo "$2" >> tasks.txt
      echo "Task added: $2"
    fi

  else
    echo "Write a task to be added to the list."
  fi

elif [ "$1" == "list" ]; then
  echo "My to-do list:"
  if [ -s "tasks.txt" ]; then
    nl -w2 -s'. ' "tasks.txt"
  else
    echo "No task found from your list."
fi

elif [ "$1" == "delete" ]; then
    if [ -n "$2" ]; then
      if [[ "$2" =~ ^[0-9]+$ ]]; then
    
      total=$(wc -l < "tasks.txt")
      if [ "$2" -le "$total" ] && [ "$2" -gt 0 ]; then
        sed -i "${2}d" "tasks.txt"

  echo "task $2 has been deleted."
  else
  echo "task number not found."
  fi

else
  echo "Please enter the task number to be deleted."
fi

  #Wrong commamd enterd
  else
    echo "Usage:"
    echo "./todo.sh add \"Task name\""
    echo "./todo.sh list"
    echo "./todo.sh delete \""number to be deleted on the list"\""
  fi
fi