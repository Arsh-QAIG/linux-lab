#!/bin/bash

#This script analyzes the primary root system space, if disk space croses a designated threshold
#it gives a warning

#--CONFIGURATION--
THRESHOLD=85
TARGET_PARTITION="/"

#Extract current disk uage by def, grep and awk
CURRENT_USAGE=$(df -h "$TARGET_PARTITION" | awk  'NR==2 {print $5}' | tr -d '%')


#COMPARE CURRENT USAGE AGAINST THRESHOLD--
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "[WARNING] Disk usgae on '$TARGET_PARTITION' is critically high"
else 
    echo "[OK] Disk is running at ${CURRENT_USAGE}%"

fi

