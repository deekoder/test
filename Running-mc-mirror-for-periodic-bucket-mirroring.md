# Running ``mc mirror`` for periodic bucket mirroring.
In this documentation we will walk you through how to setup two minio servers & using ``cron`` for periodic mirroring of bucket from one server to another. 

## 1. Prerequisites
* Download Minio server from [here](https://docs.minio.io/docs/minio)
* Download & Install mc from [here](https://docs.minio.io/docs/minio-client-quick-start-guide)

## 2. Assumptions
* Bucket name ``mybucket`` on ``192.168.1.11`` is getting mirrored to ``192.168.1.12``  using ``mc mirror`` running in backgorung with cron.
* This example has been tested on ``Ubuntu Linux`` & uses Cron. Cron is a system utility available for Unix/Linux operating system by which you can schedule an autoamtic task on certain date/day/time. check ``man cron `` for more detials.

## 3. Setting up Minio Servers 
### A. Setting up minio server on 192.168.1.11
```sh
$ ./minio server minio1-data/

AccessKey: 779MURIVYBYNPTYE7O8I  SecretKey: lVbZmz4CvGkBl7JKw5icuL7RCcSvpBJTkAJTFQwz  Region: us-east-1

Minio Object Storage:
    http://127.0.0.1:9000
    http://192.168.1.11:9000

Minio Browser:
    http://127.0.0.1:9000
    http://192.168.1.11:9000

To configure Minio Client:
    $ wget https://dl.minio.io/client/mc/release/linux-amd64/mc
    $ chmod 755 mc
    $ ./mc config host add myminio http://127.0.0.1:9000 MURIVYBYNPTYE7O8I779 lVbZmz4CvGkBl7JKw5icuL7RCcSvpBJTkAJTFQwz

```
* Adding ``minio1`` mc alias:
```sh
$ ./mc config host add minio1 http://192.168.1.11:9000 MURIVYBYNPTYE7O8I779 lVbZmz4CvGkBl7JKw5icuL7RCcSvpBJTkAJTFQwz
```
* Create a bucket name ``mybucket`` and add object name ``myfile.txt`` to it.
```
$ ./mc mb minio1/mybucket
$ ./mc cp myfile.txt minio1/mybucket
```
### B. Setting up second minio server on 192.168.1.12
```sh
$ ./minio server minio2-data/

AccessKey: YRDRWWQLEWS9OBJ31GZ2  SecretKey: y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj  Region: us-east-1

Minio Object Storage:
    http://127.0.0.1:9000
    http://192.168.1.12:9000

Minio Browser:
    http://127.0.0.1:9000
    http://192.168.1.12:9000

To configure Minio Client:
    $ wget https://dl.minio.io/client/mc/release/linux-amd64/mc
    $ chmod 755 mc
    $ ./mc config host add myminio http://127.0.0.1:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj
```
* Adding ``minio2`` mc alias:
```sh
$ ./mc config host add minio2 http://192.168.1.12:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj
```
* Create a bucket name ``mybucket``
```
$ ./mc mb minio1/mybucket
```
### C. Add mc alias entry for the second server in the first server
* Adding second server (``192.168.1.12``) to mc's alias list in the first server(``192.168.1.11``) 
```sh
$ ./mc config host add minio2 http://192.168.1.12:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj
```

## 4. Setting crontab 
* We are going to add crontab configuration on ``192.168.1.11``.
### A. Script
```sh
#!/bin/bash
minio1="minio1/mybucket"
minio2="minio2/mybucket"
MC_PATH="/home/minio/mc"
$MC_PATH --quiet mirror $minio1 $minio2
```
### B. Setting at Cron
* Setting executable permissions for the script 
```
$ chmod 755 /home/minio/minio.sh
```
* Add entry to the crontab file
```sh
$ crontab -e
*/30 * * * * /home/minio/minio.sh 
```
*Note*: Change the script path your setup. In this setup cron will run `mc mirror` every 30 minutes.
