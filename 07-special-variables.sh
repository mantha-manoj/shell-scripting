#!/bin/bash

# Speacial Variables in Linux

echo "All args passed to script: $@"
echo "Number of args passed to script: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Who is running script: $USER"
echo "Home directory of current running user: $HOME"
echo "PID of the script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "Checking previous exit status code: $?"
echo "All args passed to script: $*"