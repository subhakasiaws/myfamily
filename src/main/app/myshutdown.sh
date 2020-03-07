#!/bin/bash -e

BASE_PATH=$( cd $( dirname $0 )/..; pwd -P )
BIN_PATH="${BASE_PATH}/bin"
LOG_PATH="${BASE_PATH}/log"

echo "BASE_PATH: $BASE_PATH "
echo "BIN_PATH: $BIN_PATH "
echo "LOG_PATH: $LOG_PATH "

APP_NAME=myservice

PID_FILE="${LOG_PATH}/${APP_NAME}.pid"

if [ ! -f ${PID_FILE} ]; then
    echo "Unable to find PID file $PID_FILE...cannot shutdown."
    exit 1
fi 

PID=`cat ${PID_FILE}`

set +e
kill -0 ${PID} &> /dev/null
result=$?
set -e

if [ ${result} -ne 0 ]; then
    echo "$APP_NAME is already shutdown. Removing PID file..."
    rm ${PID_FILE}
    exit 0
fi

kill -TERM ${PID}
echo -n "Waiting for $APP_NAME to shutdown"
i=0

while [ ${i} -lt 30 ]; do
    sleep 1;
    echo -n "."
    set +e
    kill -0 ${PID} &> /dev/null
    result=$?
    set -e
    if [ ${result} -ne 0 ]; then
       echo
       echo "Done."
       rm ${PID_FILE}
       exit 0
    fi
done

echo
echo "Unable to gracefully shutdown $APP_NAME...attempting to kill by force."
kill -9 ${PID} > /dev/null
set +e
kill -0 ${PID} &> /dev/null
result=$?
set -e

if [ ${result} -ne 0 ]; then
    echo "Success."
    rm ${PID_FILE}
    exit 0
else 
    echo "Failed. ${APP_NAME} is still running as ${PID}"
    exit 1
fi
   
