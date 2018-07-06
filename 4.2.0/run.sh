#!/bin/bash

# pwd and env 
cd bin && export JAVA_OPT=" -Duser.home=/opt"

function launch_brocker_server() {

  if [ x"$NAME_SERVER_LIST" == x"" ];then
    echo "env var NAME_SERVER_LIST invalid"
    exit 1
  fi

  sh mqbroker -n $NAME_SERVER_LIST 

}

function launch_name_server() {

  sh mqnamesrv 

}

if [[ "${BROKER_SERVER}" == "true" ]]; then
  launch_brocker_server
  exit 0
fi

if [[ "${NAME_SERVER}" == "true" ]]; then
  launch_name_server
  exit 0
fi

