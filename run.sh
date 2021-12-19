#!/bin/bash

WAIT_TIME=1
SLEEP_TIME=1
MAX_TRIES=500
CURRENT_TRY=0

while true
do
    if nc -w $WAIT_TIME "$HOST" "$PORT"; then
        echo "port $PORT at $HOST is open"
        exit 0
    else
        echo "still waiting for port $PORT to open"
    fi

    if [ $CURRENT_TRY -eq $MAX_TRIES ]; then
        echo "timed out waiting for port to open"
        exit 1
    fi

    CURRENT_TRY=$((CURRENT_TRY+1))
    sleep $SLEEP_TIME
done