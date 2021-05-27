#!/bin/bash

APPNAME="EDGE APP"
APPCODE=edge-app
APPPID=$APPCODE.pid
 if [ -f $APPPID ]; then
    PID=$(cat $APPPID);
    echo "Stopping $APPNAME..."
    kill $PID;
    echo "$APPNAME stopped!"
    rm $APPPID
else
    echo "$APPNAME is not running ..."
fi
