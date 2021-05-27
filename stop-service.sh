#!/bin/bash
 if [ -f $APPPID ]; then
    PID=$(cat $APPPID);
    echo "Stopping $APPNAME..."
    kill $PID;
    echo "$APPNAME stopped!"
    rm $APPPID
else
    echo "$APPNAME is not running ..."
fi
