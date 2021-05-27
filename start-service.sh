APPNAME="EDGE APP"
APPCODE=edge-app

echo "Starting $APPNAME server ..."
if [ ! -f $APPPID ]; then
    nohup java -jar  ./app/target/aws-test-fat.jar 2>> /dev/null >> /dev/null &
    #nohup java -jar ./app/target/aws-test-fat.jar > service.out 2> errors.txt <
    echo $! > $APPPID
    echo "$APPNAME started!"
else
    echo "$APPNAME is already running ..."
fi
