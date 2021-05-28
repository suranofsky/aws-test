#!/bin/bash

check_status() {

  # Running ps with some arguments to check if the PID exists
  # -C : specifies the command name
  # -o : determines how columns must be displayed
  # h : hides the data header
  s=`ps -C 'java -jar /home/ec2-user/app/target/aws-test-fat.jar' -o pid h`

  # If somethig was returned by the ps command, this function returns the PID
  if [ $s ] ; then
    return $s
  fi

  # In any another case, return 0
  return 0

}




# At first checks if the application is already started calling the check_status
  # function
  check_status

  # $? is a special variable that hold the "exit status of the most recently executed
  # foreground pipeline"
  pid=$?

  if [ $pid -ne 0 ] ; then
    echo "The application is already started"
    exit 1
  fi

  # If the application isn't running, starts it
  echo -n "Starting application: "

  # Redirects default and error output to a log file
  nohup java -jar /home/ec2-user/app/target/aws-test-fat.jar >> /home/ec2-user/app/logs/output.log 2>&1 &
  echo "OK"



