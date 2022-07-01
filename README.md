# Setup redis cluster on local with docker

## Requirement
| Installation | Link |
| ------ | ------ |
| Docker | [Link install docker](https://docs.docker.com/engine/install) |
| Redis CLI ( Mac ) | [Link install redis on Mac](https://redis.io/docs/getting-started/installation/install-redis-on-mac-os/) |
| Redis CLI ( Win / Ubuntu ) | [Google](https://goole.com.vn) 😂 |

## Run redis cluster
**Step 1**. Run script bash ( on Mac or Ubuntu )
```sh
bash run-cluster.sh
```
**Step 2**: After docker run redis containers, **enter "yes"** to confirm run redis cluster
```sh
>>> Performing hash slots allocation on 7 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 127.0.0.1:7005 to 127.0.0.1:7001
Adding replica 127.0.0.1:7006 to 127.0.0.1:7002
Adding replica 127.0.0.1:7007 to 127.0.0.1:7003
Adding extra replicas...
Adding replica 127.0.0.1:7004 to 127.0.0.1:7001
>>> Trying to optimize slaves allocation for anti-affinity
[WARNING] Some slaves are in the same host as their master
M: 32030efa5f0acebfe28e6153744cd9702825474e 127.0.0.1:7001
   slots:[0-5460] (5461 slots) master
M: d88ee08104e1ab7e4c691128d199c11551d01361 127.0.0.1:7002
   slots:[5461-10922] (5462 slots) master
M: de70ab08990bb47e1712eff6cecc089a59420929 127.0.0.1:7003
   slots:[10923-16383] (5461 slots) master
S: 2434009ce6139d06ec5cf3a9a48184232ffbad47 127.0.0.1:7004
   replicates d88ee08104e1ab7e4c691128d199c11551d01361
S: 0f2a8419ca04454c4795d58c8759177fca59df58 127.0.0.1:7005
   replicates de70ab08990bb47e1712eff6cecc089a59420929
S: 218fb960a5ddf7df7402d30c3ef8cc0298371d77 127.0.0.1:7006
   replicates 32030efa5f0acebfe28e6153744cd9702825474e
S: bfd116e3b3139d25729c7993767ffa949a7163d5 127.0.0.1:7007
   replicates 32030efa5f0acebfe28e6153744cd9702825474e
Can I set the above configuration? (type 'yes' to accept): yes
```

If redis cluster run success
```sh
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
..
>>> Performing Cluster Check (using node 127.0.0.1:7001)
M: 32030efa5f0acebfe28e6153744cd9702825474e 127.0.0.1:7001
   slots:[0-5460] (5461 slots) master
   2 additional replica(s)
S: 218fb960a5ddf7df7402d30c3ef8cc0298371d77 127.0.0.1:7006
   slots: (0 slots) slave
   replicates 32030efa5f0acebfe28e6153744cd9702825474e
M: de70ab08990bb47e1712eff6cecc089a59420929 127.0.0.1:7003
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
S: 2434009ce6139d06ec5cf3a9a48184232ffbad47 127.0.0.1:7004
   slots: (0 slots) slave
   replicates d88ee08104e1ab7e4c691128d199c11551d01361
S: 0f2a8419ca04454c4795d58c8759177fca59df58 127.0.0.1:7005
   slots: (0 slots) slave
   replicates de70ab08990bb47e1712eff6cecc089a59420929
S: bfd116e3b3139d25729c7993767ffa949a7163d5 127.0.0.1:7007
   slots: (0 slots) slave
   replicates 32030efa5f0acebfe28e6153744cd9702825474e
M: d88ee08104e1ab7e4c691128d199c11551d01361 127.0.0.1:7002
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

**Step 3**: Check connection redis

Connect to a node and set data on redis
```sh
redis-cli -c -p 7001
127.0.0.1:7001> set test i_love_someone
-> Redirected to slot [6918] located at 127.0.0.1:7002
OK
```

Get data on redis
```sh
127.0.0.1:7002> get test
"i_love_someone"
127.0.0.1:7002> exit
```

Exit
```sh
127.0.0.1:7002> exit
```
