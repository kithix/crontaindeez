#!/usr/bin/env bash

# Checking if cronfile is valid
crontab /etc/crontab
if [ $? != 0 ]; then
    echo "Check format of crontab"
    exit 1
fi
crontab -r


# Run cron in the foreground
echo "Running cron"
cron -f

# If cron dies, any underlying processes may still be running
# Kill all processes based on containers UID
echo "Killing all processes"
pkill -U $UID