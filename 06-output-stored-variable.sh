#!/bin/bash

START_TIME=$(data +%s)

echo "Script executed at: $START_TIME"

sleep 10

END_TIME=$(date +%s)
TOTAL_TIME=$(($START_TIME-$END_TIME))

echo "Script executed in: $TOTAL_TIME seconds"