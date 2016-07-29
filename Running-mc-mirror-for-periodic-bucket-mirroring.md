# Running ``mc mirror`` for periodic bucket mirroring. [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![minio_MIRROR](https://github.com/koolhead17/test/blob/master/docs/screenshots/image.jpeg?raw=true)

In this documentation we will walk you through how to setup two minio servers & using ``cron`` for periodic mirroring of bucket from one server to another. 

## 1. Prerequisites

* Download Minio server from [here](https://docs.minio.io/docs/minio)
* Download & Install mc from [here](https://docs.minio.io/docs/minio-client-quickstart-guide)

## 2. Assumptions

* Bucket name ``mybucket`` on ``192.168.1.11`` is getting mirrored to ``192.168.1.12``  using ``mc mirror`` running in background with cron.
* This example has been tested on ``Ubuntu Linux`` & uses Cron. Cron is a system utility available for Unix/Linux operating system by which you can schedule an autoamtic task on certain date/day/time. check ``man cron `` for more detials.

## 3. Setting up Minio Servers 

### Setting up minio server on 192.168.1.11

```sh

$ ./minio server minio1-data/

Endpoint:  http://127.0.0.1:9000  http://192.168.1.11:9000
AccessKey: MURIVYBYNPTYE7O8I779 
SecretKey: lVbZmz4CvGkBl7JKw5icuL7RCcSvpBJTkAJTFQwz
Region:    us-east-1

Browser Access:
   http://127.0.0.1:9000  http://192.168.1.11:9000

Command-line Access: https://docs.minio.io/docs/minio-client-quickstart-guide
  $ mc config host add myminio http://192.168.1.11:9000 USWUXHGYZQYFYFFIT3RE MOJRH0mkL1IPauahWITSVvyDrQbEEIwljvmxdq03

Object API (Amazon S3 compatible):
  Go:         https://docs.minio.io/docs/golang-client-quickstart-guide
  Java:       https://docs.minio.io/docs/java-client-quickstart-guide
  Python:     https://docs.minio.io/docs/python-client-quickstart-guide
  JavaScript: https://docs.minio.io/docs/javascript-client-quickstart-guide

```
* Adding ``minio1`` mc alias:

```sh
$ ./mc config host add minio1 http://192.168.1.11:9000 MURIVYBYNPTYE7O8I779 lVbZmz4CvGkBl7JKw5icuL7RCcSvpBJTkAJTFQwz

```

* Create a bucket name ``mybucket`` and add object name ``myfile.txt`` to it.

```sh

$ ./mc mb minio1/mybucket
$ ./mc cp myfile.txt minio1/mybucket

```

### Setting up second minio server on 192.168.1.12


```sh

$ ./minio server minio2-data/

Endpoint:  http://127.0.0.1:9000  http://192.168.1.12:9000
AccessKey: YRDRWWQLEWS9OBJ31GZ2
SecretKey: y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj
Region:    us-east-1

Browser Access:
   http://127.0.0.1:9000  http://192.168.1.12:9000

Command-line Access: https://docs.minio.io/docs/minio-client-quickstart-guide
  $ mc config host add myminio http://192.168.1.12:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj

Object API (Amazon S3 compatible):
  Go:         https://docs.minio.io/docs/golang-client-quickstart-guide
  Java:       https://docs.minio.io/docs/java-client-quickstart-guide
  Python:     https://docs.minio.io/docs/python-client-quickstart-guide
  JavaScript: https://docs.minio.io/docs/javascript-client-quickstart-guide


```
* Adding ``minio2`` mc alias:


```sh

$ ./mc config host add minio2 http://192.168.1.12:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj

```

* Create a bucket name ``mybucket``

```sh

$ ./mc mb minio1/mybucket
```

### Add mc alias entry for the second server in the first server

* Adding second server (``192.168.1.12``) to mc's alias list in the first server(``192.168.1.11``) 

```sh

$ ./mc config host add minio2 http://192.168.1.12:9000 YRDRWWQLEWS9OBJ31GZ2 y2sSWzx5ytwvkELcxOuSaQ8n3doNqoIilRpb5Kjj

```

## 4. Setting crontab 

* We are going to add crontab configuration on ``192.168.1.11``.

### Script

```sh

#!/bin/bash
minio1="minio1/mybucket"
minio2="minio2/mybucket"
MC_PATH="/home/minio/mc"
$MC_PATH --quiet mirror $minio1 $minio2

```
### Setting at Cron

* Setting executable permissions for the script 

```sh

$ chmod 755 /home/minio/minio.sh
```

* Add entry to the crontab file

```sh

$ crontab -e
*/30 * * * * /home/minio/minio.sh 
```
*Note*: Change the script path your setup. In this setup cron will run `mc mirror` every 30 minutes.
