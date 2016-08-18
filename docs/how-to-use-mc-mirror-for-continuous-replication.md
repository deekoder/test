# How to use mc mirror for continuous replication [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


In this recipe we will learn how to use ``mc mirror`` continuous replication feature.

## 1. Prerequisites

* Install ``Minio`` Server from [here](http://docs.minio.io/docs/minio). Follow [this](https://docs.minio.io/docs/how-to-run-multiple-minio-server-instances-on-single-machine) guide to deploy multiple Minio servers on single host.
* Download & Install `` mc`` from [here](https://docs.minio.io/docs/minio-client-quickstart-guide)
* Familiarity with `` mc client`` commands, read mc client complete guide [here](https://docs.minio.io/docs/minio-client-complete-guide)

## 2. Configuration 

## Replication between two Minio Servers.

In this setup, we have Minio Server running with Alias ``m1`` and ``m2``

```sh
$ mc config host list
m1: http://10.1.10.225:9000 <-  H5K8172RVM311Q2XFEHX |  5bRnl3DGhNM+fRBMxOii11k8iT78cNSIfoqnJfwC |  S3v4
m2: http://10.1.10.225:9004 <-  G4HLX27DHPYR6XAADUSA |  w+RQYkvqTPByVVaOFFQP70dA6HbpgYOBEvW/0Id+ |  S3v4
```
``mc mirror`` continuous replication will happen from Minio Server ``m1`` from bucket name ``bucket1`` to ``m2`` Minio server on bucket name ``bucket1``

Setting up continuous replication between the buckets on two Minio servers.

```sh
$ mc mirror --force --remove --watch m1/bucket1 m2/bucket1
```

**Note:** You can run this command can run as background process.

Upload Object on ``m1`` to ``bucket1``

```sh
$ mc cp README.md m1/bucket1
README.md:                   7 B / 7 B  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
```
Check if the replication has happened on m2/bucket1 or not?

```sh
$ mc ls m2/bucket1
[2016-08-18 10:57:50 PDT]     7B README.md
```
**NOTE:** We added an Object README.md on Minio server ``m1`` and with ``mc mirror`` continuous replication the object got copied to ``m2`` which was empty earlier.

## Replication between  Minio Server and AWS S3.

In this setup, we have Minio Server running with Alias ``m1`` and AWS S3 with ``s3``

```sh
$ mc config host list
m1: http://10.1.10.225:9000 <-  H5K8172RVM311Q2XFEHX |  5bRnl3DGhNM+fRBMxOii11k8iT78cNSIfoqnJfwC |  S3v4
s3: https://s3.amazonaws.com <- T4HLX27DHPYR6XAADIND |  w+RQYkvqTPByVVaOFFQP80dA6HbpgYOBEvW/8Id+ |  S3v4
```

``mc mirror`` continuous replication will happen from Minio Server ``m1`` from bucket name ``mybucket`` to AWS S3 ``s3``  on bucket name ``kline``

Setting up continuous replication between the buckets on two Minio servers.

```sh
$ mc mirror --force --remove --watch m1/mybucket s3/kline
```

**Note:** You can run this command can run as background process.

Upload Object on ``m1`` to ``mybucket``

```sh
$ mc cp README.md m1/mybucket
README.md:                   7 B / 7 B  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
```
Check if the replication has happened to AWS S3 bucket ``kline`` or not?

```sh
$ mc ls s3/kline
[2016-08-18 12:50:38 PDT]     7B README.md
```
**NOTE:** 
* We added an Object README.md on Minio server ``m1`` and with ``mc mirror`` continuous replication the object got copied to AWS S3 bucket `kline`` which was empty earlier.
* Due to limitations from AWS S3, this operation  will not work from AWS S3 to Minio server.


