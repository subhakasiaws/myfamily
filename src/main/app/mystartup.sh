#!/bin/bash -e

BASE_PATH=$( cd $( dirname $0 )/..; pwd -P )
BIN_PATH="${BASE_PATH}/bin"
LOG_PATH="${BASE_PATH}/log"
WORK_PATH="${BASE_PATH}/work"

echo ""
export RINS_SERVICE_CONFIG_ROOT
echo "RINS_SERVICE_CONFIG_ROOT: '${RINS_SERVICE_CONFIG_ROOT}'"

#-----------------------------------------------------------------------------------------
# RINS_WORKFLOW_DEPENDENCIES:

APP_NAME=myservice
export APP_NAME

#-----------------------------------------------------------------------------------------

JVM_ARGS="$JVM_ARGS -Xms1024M -Xmx1024M"
JVM_ARGS="$JVM_ARGS -XX:+UseConcMarkSweepGC -verbose:gc -Xloggc:$LOG_PATH/$APP_NAME-gc.log"
JVM_ARGS="$JVM_ARGS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$LOG_PATH"
JVM_ARGS="$JVM_ARGS -XX:SoftRefLRUPolicyMSPerMB=0"

JAVA_OPTS="${JAVA_OPTS} -Djava.io.tmpdir=${WORK_PATH}"

cd ${BASE_PATH}

mkdir -p ${WORK_PATH}

if [ -z "${JAVA_HOME}" ]; then
    JAVACMD="java"
else
    JAVACMD="${JAVA_HOME}/bin/java"
fi

JAVACMD="${JAVACMD}"

PID_FILE="${LOG_PATH}/${APP_NAME}.pid"

mkdir -p ${LOG_PATH}

if [ -f ${PID_FILE} ]; then
    result=0
    old_pid=`cat ${PID_FILE}`
    echo "PID file ${PID_FILE} exists..."
    set +e
    kill -0 ${old_pid} &> /dev/null
    result=$?
    set -e

    if [ ${result} -eq 0 ]; then
        echo "${APP_NAME} is still running as process ${old_pid}. Exiting..."
        exit 1
    fi

    echo "Process ${old_pid} is no longer active. Deleting PID file and starting..."
fi

APPLICATION_ARGS="${APPLICATION_ARGS} --spring.application.name=${APP_NAME} 
echo ""
echo "APPLICATION_ARGS: '${APPLICATION_ARGS}'"

if [ ! -z "${LOG_PATH}" ]; then
    JAVA_OPTS="${JAVA_OPTS} -DLOG_PATH=${LOG_PATH}"
fi

JAVA_OPTS="${JAVA_OPTS} -DAPP_NAME=${APP_NAME}"

WAR_FILE=${BASE_PATH}/${APP_NAME}*.war

COMMAND="${JAVACMD} ${JVM_ARGS} ${JAVA_OPTS} -jar ${WAR_FILE} ${APPLICATION_ARGS}"

echo ""
echo "Starting ${APP_NAME} ... "
echo ""
echo "'${COMMAND}'"

nohup ${COMMAND} > "${LOG_PATH}/${APP_NAME}.out" 2>&1 &
PID=$!

echo ${PID} > ${PID_FILE}