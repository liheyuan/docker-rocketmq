## How To Run Broker
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
