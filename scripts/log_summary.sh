#!/bin/bash

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s LOG_FILE\n' "$0" >&2
    exit 2
fi
LOG_FILE=$1

if [[ ! -f "$LOG_FILE" || ! -r "$LOG_FILE" ]]; then
    printf '[ERROR] Not a readable file: %s\n' "$LOG_FILE" >&2
    exit 1
fi

echo "=== Hourly Error Summary Report ==="
echo "Hour  | Count of Errors Found"
echo "-----------------------------"

# Fetch today's error logs from journalctl, grab the time field, and count them
awk '$3 == "ERROR" {
    key = $1 " " substr($2, 1, 2) ":00"
    count[key]++
}
END {
    for (key in count)
        printf "%s | %d errors\n", key, count[key]
}' "$LOG_FILE" | sort

echo "-----------------------------"
