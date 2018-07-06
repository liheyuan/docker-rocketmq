#!/bin/bash

# pwd and env 
export JAVA_OPT=" -Duser.home=/opt"

function launch_broker_server() {

  if [ x"$NAME_SERVER_LIST" == x"" ];then
    echo "env var NAME_SERVER_LIST invalid"
    exit 1
  fi

  if [ x"$1" == x"" ];then
    echo "flag invalid"
    exit 1
  fi

  sh ./bin/mqbroker -c ./conf/2m-noslave/broker-${1}.properties -n $NAME_SERVER_LIST

}

function launch_name_server() {

  sh ./bin/mqnamesrv

}

if [[ "${BROKER_SERVER_A}" == "true" ]]; then
  launch_broker_server "a"
  exit 0
fi

if [[ "${BROKER_SERVER_B}" == "true" ]]; then
  launch_broker_server "b"
  exit 0
fi

if [[ "${NAME_SERVER}" == "true" ]]; then
  launch_name_server
  exit 0
fi

