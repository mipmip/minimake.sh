#!/usr/bin/env bash

#    __  __ ___ _   _ ___   __  __    _    _  _______
#   |  \/  |_ _| \ | |_ _| |  \/  |  / \  | |/ / ____|
#   | |\/| || ||  \| || |  | |\/| | / _ \ | ' /|  _|
#   | |  | || || |\  || |  | |  | |/ ___ \| . \| |___
#   |_|  |_|___|_| \_|___| |_|  |_/_/   \_\_|\_\_____|

## 1: MINIMAKE INIT. PUT THIS IN THE TOP OF YOUR SCRIPT

COMMANDS=()
COMMAND_DESC=()

make_command() {
  COMMANDS+=($1)
  COMMAND_DESC+=("$2")
}

usage(){
  printf "Usage: %s command\n\nCommands:\n" $0
  line="              "
  for (( i=0; i<=$(( ${#COMMANDS[*]} -1 )); i++ )); do
    printf "  %s %s ${COMMAND_DESC[$i]}\n" ${COMMANDS[$i]} "${line:${#COMMANDS[$i]}}"
  done
}

## 2: MINIMAKE DEFINE YOUR COMMANDS

## REMOVE THIS WHEN YOU GET THE PICTURE
make_command "demo" "this command is for explaining how minimake works"
demo(){
  echo "This is a demo command"
}

## YOUR CODE HERE

## 3:MINIMAKE EXECUTION
if test "$#" -eq 1 &&  [[ " ${COMMANDS[@]} " =~ $1 ]]; then
  eval "$1"
else
  usage
fi
