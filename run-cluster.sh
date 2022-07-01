docker container rm redis-cluster -f

docker run --platform "linux/amd64" -dp 7001:7001 -dp 17001:17001 -dp 7002:7002 -dp 17002:17002 -dp 7003:7003 -dp 17003:17003 \
-dp 7004:7004 -dp 17004:17004 -dp 7005:7005 -dp 17005:17005 -dp 7006:7006 -dp 17006:17006 -dp 7007:7007 -dp 17007:17007 \
-v /Users/lap14886/Documents/Data/docker/redis/conf:/usr/local/etc/redis --name redis-cluster redis

docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7001.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7002.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7003.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7004.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7005.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7006.conf
docker exec -d redis-cluster  redis-server /usr/local/etc/redis/redis-7007.conf


redis-cli --cluster create  127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 127.0.0.1:7006 127.0.0.1:7007 \
--cluster-replicas 1