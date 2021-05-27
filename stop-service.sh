#!/bin/bash
#Check if the program is running
check_status() {

  # Running ps with some arguments to check if the PID exists
  # -C : specifies the command name
  # -o : determines how columns must be displayed
  # h : hides the data header
  s=`ps -C 'java -jar ./app/target/aws-test-fat.jar' -o pid h`

  # If somethig was returned by the ps command, this function returns the PID
  if [ $s ] ; then
    return $s
  fi

  # In any another case, return 0
  return 0

}

  # Like as the start function, checks the application status
  check_status

  pid=$?

  if [ $pid -eq 0 ] ; then
    echo "Application is already stopped"
    exit 0
  fi

  # Kills the application process
  echo -n "Stopping application: "
  kill -9 $pid &
  echo "OK"
