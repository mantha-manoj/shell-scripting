#!/bin/bash

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


dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "Installing Nginx"

dnf install mysql -y &>> $LOG_FILE
VALIDATE $? "Installing MySQL"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "Installing NodeJs"