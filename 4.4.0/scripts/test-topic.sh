#!/bin/bash

BROKER_NAME="rocketmq-broker1"

for i in {0..100}
do
    echo $i
    sh mqadmin updateTopic -b $BROKER_NAME:10911 -t topic$i
done
