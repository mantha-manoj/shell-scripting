#!/bin/bash

USERID=$(id -u) # check the root user or not

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root user access"
    exit 1
fi

echo "Installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Installing Nginx ... FAILURE"
    exit 1
else
    echo "Installing Nginx ... SUCCESS"
fi

echo "Installing mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "Installing MySQL ... FAILURE"
    exit 1
else
    echo "Installing MySQL ... SUCCESS"
fi

echo "Installing nodejs"
dnf install nodejs -y

if [ $? -ne 0 ]; then 
    echo "Installing Nodejs ... FAILURE"
    exit 1
else
    echo "Installing Nodejs ... SUCCESS"
fi