#!/bin/bash

# pwd and env 
export JAVA_OPT=" -Duser.home=/opt/rocketmq_home"

function launch_broker_cluster_server() {

  if [ x"$NAME_SERVER_LIST" == x"" ];then
    echo "env var NAME_SERVER_LIST invalid"
    exit 1
  fi

  if [ x"$1" == x"" ];then
    echo "config invalid"
    exit 1
  fi

  sh ./bin/mqbroker -c $1 -n $NAME_SERVER_LIST

}

function launch_name_server() {

  sh ./bin/mqnamesrv

}

function get_broker_cluster_id() {

  conf=$1
  idx=$2

  if [[ x"$conf" == x"2m-noslave" ]]; then
    case $idx in
      0)
        echo "a"
        ;;
      1)
        echo "b"
        ;;
      *)
        ;;
    esac
  elif [[ x"$conf" == x"2m-2s-async" ]]; then
    case $idx in
      0)
        echo "a"
        ;;
      1)
        echo "a-s"
        ;;
      2)
        echo "b"
        ;;
      3)
        echo "b-s"
        ;;
      *)
        ;;
    esac
  elif [[ x"$conf" == x"2m-2s-sync" ]]; then
    case $idx in
      0)
        echo "a"
        ;;
      1)
        echo "a-s"
        ;;
      2)
        echo "b"
        ;;
      3)
        echo "b-s"
        ;;
      *)
        ;;
    esac
  fi

}

if [[ x"${NAME_SERVER}" == x"true" ]]; then
  launch_name_server
  exit 0
fi

if [[ x"${BROKER_SERVER}" == x"true" ]]; then
  if [[ x"${BROKER_CLUSTER_CONF}" == x"" ]]; then
    echo "launch broker as single"
    launch_broker_cluster_server "./conf/broker.conf"
  else
    echo "launch broker as cluster"
    BROKER_CLUSTER_IDX=${HOSTNAME##*-}
    BROKER_CLUSTER_ID=$(get_broker_cluster_id $BROKER_CLUSTER_CONF $BROKER_CLUSTER_IDX) 
    launch_broker_cluster_server "./conf/${BROKER_CLUSTER_CONF}/broker-${BROKER_CLUSTER_ID}.properties"
  fi
fi

