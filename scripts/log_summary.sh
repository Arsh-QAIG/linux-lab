#!/bin/bash

echo "=== Hourly Error Summary Report ==="
echo "Hour  | Count of Errors Found"
echo "-----------------------------"

# Fetch today's error logs from journalctl, grab the time field, and count them
journalctl --since today -p err --no-pager | awk '{print $3}' | cut -d: -f1 | sort | uniq -c | awk '{print $2 ":00 | " $1 " errors"}'

echo "-----------------------------"
