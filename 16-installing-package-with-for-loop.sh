#!/bin/bash

# Run using this command sudo sh 16-installing-package-with-for-loop.sh mysql nginx nodejs

USERID=$(id -u) # check the root user or not
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="$LOG_FOLDER/$0.log"

mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root user access" | tee -a $LOG_FILE
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then 
        echo "$2 ... FAILURE" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 ... SUCCESS" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf install $package -y  &>> $LOG_FILE
    VALIDATE $? "$package Installing"

done

