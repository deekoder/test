# How to use Cyberduck with Minio
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


In this document you will learn how to carry out basic operations on Minio using Cyberduck. Cyberduck is an open source client for FTP and SFTP, WebDAV, OpenStack Swift, and Amazon S3, available for Mac OS X and Windows (as of version 4.0) licensed under the GPL. 

##Prerequisites
* Cyberduck is installed and running. If not please download Cyberduck from [here](https://cyberduck.io/). Since Minio is Amazon S3 API compaitble you will need to download [Generic S3 Profiles](https://trac.cyberduck.io/wiki/help/en/howto/s3#HTTPS). We are downloading ``HTTPS`` profile for this setup.

* Minio Server is running at https://play.minio.io:9000. Minio Play is a hosted service by Minio. Feel free to use this service for testing and development. 

###1. Add Play server authentication in cyberduck

Click open connection, select ``HTTPS``

![I_IMAGE](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/defaultdashboard.jpg?raw=true)


###2. Replace the existing ``AWS S3`` detials with  ``play server`` credntials to:

```sh
Server: ``play.minio.io``
Port: ``9000``
Access Key ID: ``Q3AM3UQ867SPQQA43P2F``
Secret Access Key: ``zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG``
```
![MINIO_DASH](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/connecttominio.jpg?raw=true)

###3. Click on the ``connect`` tab to establish connection.
Once the connected is established you can explore the following operations.

##### Bucket listing 

![B_LISTING](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/allbuckets.jpg?raw=true)

##### Upload Object

![U_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/uploadobject.jpg?raw=true)

##### Download Object

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/downloadobject.jpg?raw=true)

##### Delete Object

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/deleteobject.jpg?raw=true)

##### Download bucket

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/downloadbucket.jpg?raw=true)

##### Mirror Bucket

![M_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/mirror.jpg?raw=true)

##### Delete Bucket

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/deletebucket.jpg?raw=true)

###3.Explore Further
* [Minio Client complete guide](https://docs.minio.io/docs/minio-client-complete-guide)
* [Cyberduck project homepage](https://cyberduck.io)


