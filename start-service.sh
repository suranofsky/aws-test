#!/bin/bash

PID=1
if [ -f './pid' ]; then
	    PID=$(cat ./pid)
fi

if ps -p $PID > /dev/null
then
	   echo "Service with $PID is already running"
   else
	       nohup java -jar ./app/target/aws-test-fat.jar > service.out 2> errors.txt < /dev/null & PID=$!; echo $PID > ./pid
fi
