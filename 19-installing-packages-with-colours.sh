#!/bin/bash

# Run using this command sudo sh 16-installing-package-with-for-loop.sh mysql nginx nodejs

USERID=$(id -u) # check the root user or not
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="$LOG_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]; then 
    echo -e "$R Please run this script with root user access $N" | tee -a $LOG_FILE
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then 
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package installation"
    else
        echo -e "$package already installed, $Y skipping $N"
    fi
done

