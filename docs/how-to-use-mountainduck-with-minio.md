# How to use Mountain Duck with Minio [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

In this document you will learn how to carry out basic operations on Minio using Mountain Duck. Mountain Duck lets you mount server and cloud storage as a local disk, available for Mac OS X and Windows (as of version 1.5.5) licensed under the GPL. 

## 1. Prerequisites

* Mountain Duck is installed and running. If not please download Mountain Duck from [here](https://mountainduck.io/). We are using ``S3(HTTP)`` profile for this setup.

* Minio Server is running on localhost on port 9000 in ``HTTP``, follow [Minio quickstart guide](https://docs.minio.io/docs/minio-quickstart-guide) for installing Minio. 

_NOTE:_ You can also run Minio in ``HTTPS``, follow this [guide](https://docs.minio.io/docs/generate-let-s-encypt-certificate-using-concert-for-minio) along with Mountain Duck ``S3(HTTPS)`` profile. 

## 2. Recipe Steps

### 1. Add Minio authentication in Mountain Duck

Click on Mountain Duck icon and open the application via navigation menu. Click open connection, select ``S3(HTTP)``

![I_IMAGE](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/defaultdashboard.jpg?raw=true)

### 2. Replace the existing ``AWS S3`` details with your local ``Minio`` credentials to:

![MINIO_DASH](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/connecttominio.jpg?raw=true)

![MINIO_DASH2](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/connecttominio1.jpg?raw=true)


### 3. Click on the ``connect`` tab to establish connection.

You will be asked to connect via insecure connection since we are using HTTP, accept it. Once the connection is established you can explore operations listed below. 

#### List Bucket

![B_LISTING](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/listbuckets.jpg?raw=true)

#### Copy Object to local file system

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/copyobject.jpg?raw=true)

#### Delete Object 

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/deleteobject.jpg?raw=true)

#### Copy bucket to local file system

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/copybucket.jpg?raw=true)

#### Delete Bucket

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/mountainduck/deletebucket.jpg?raw=true)

## 3. Explore Further

* [Minio Client complete guide](https://docs.minio.io/docs/minio-client-complete-guide)
* [Mountain Duck project homepage](https://mountainduck.io)
