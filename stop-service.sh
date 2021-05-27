#!/bin/bash
#Check if the program is running
is_exist(){
  pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}' `
     #If there is no return, there is a return of 0.     
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}


  is_exist
  if [ $? -eq "0" ]; then
    kill -9 $pid
  else
    echo "${APP_NAME} is not running"
  fi  
