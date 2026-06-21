#!/bin/bash

echo "Hello World" &>> "/home/$USER/$0.log"
echoo "Hello World" &>> "/home/$USER/$0.log"

echo "Hello World" | tee -a "/home/$USER/$0.log"



