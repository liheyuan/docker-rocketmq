## How To Run NameServer 
```
# Max Heap = 8GB
docker run \
    --env MAX_POSSIBLE_HEAP=8589934592 \
    --volume "your_path_log":/root/logs \
    --volume "your_path_store":/root/store \
    -p 9876:9876 \
    coder4/rocketmq:4.2.0 sh mqnamesrv 
```

## How To Run Broker for Single Mode
```
# Max Heap = 8GB
docker run \
    --env MAX_POSSIBLE_HEAP=8589934592 \
    --volume "your_path_log":/root/logs \
    --volume "your_path_store":/root/store \
    -p 10911:10911 \
    -p 10909:10909 \
    coder4/rocketmq:4.2.0 sh mqbroker
```

## How To Run Broker for Mutiple Master Mode (No Slave)
```
# Broker1
docker run \
    --env MM_BROKER_ID=broker1 \
    --env MM_BROKER_IP=192.168.0.1 \
    --volume "your_path_log":/root/logs \
    --volume "your_path_store":/root/store \
    -p 10911:10911 \
    -p 10909:10909 \
    coder4/rocketmq:4.2.0 sh mqbroker -c ../conf/broker.conf

# Broker2
docker run \
    --env MM_BROKER_ID=broker2 \
    --env MM_BROKER_IP=192.168.0.2 \
    --volume "your_path_log":/root/logs \
    --volume "your_path_store":/root/store \
    -p 10911:10911 \
    -p 10909:10909 \
    coder4/rocketmq:4.2.0 sh mqbroker -c ../conf/broker.conf

```

