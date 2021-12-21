#!/bin/sh
set -e

trap stop SIGTERM SIGINT SIGQUIT SIGHUP

if [ "$1" = "run" ]; then
    shift
    python3 main.py
fi

#if [ "$1" = "test" ]; then
#    shift
#    pip3 install -r requirements/test.txt
#    pytest
#fi

exec "$@"
