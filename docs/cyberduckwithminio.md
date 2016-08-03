# Running Minio with Cyberduck browser.  [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


In this document we will illustrate how to carry out basic operations on Minio using Cyberduck, Open Source file browser.We will install Cyberduck on Mac & use Minio Play Server for this.

## Set up and Installation

You can download Cyberduck from [here](https://cyberduck.io/) followed by downloading  Generic S3 Profiles [here](https://trac.cyberduck.io/wiki/help/en/howto/s3#HTTPS). We are downloading ``HTTPS`` profile for this setup.

## Adding Play server authentication in cyberduck

Click open connection, select ``HTTPS``

![I_IMAGE](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/defaultdashboard.png?raw=true)


 Replace the existing ``AWS S3`` detials with  ``play server`` credntials to:

```sh
Server: ``play.minio.io``
Port: ``9000``
Access Key ID: ``Q3AM3UQ867SPQQA43P2F``
Secret Access Key: ``zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG``
```
![MINIO_DASH](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/connecttominio.png?raw=true)

and click to ``connect`` tab. After the conenction establishment you can explore below listed operations.

### Bucket listing 

![B_LISTING](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/allbuckets.png?raw=true)

### Upload Object

![U_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/uploadobject.png?raw=true)

### Download Object

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/downloadobject.png?raw=true)

### Delete Object

![D_OBJECT](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/deleteobject.png?raw=true)

### Download bucket

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/downloadbucket.png?raw=true)

### Mirror Bucket

![M_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/mirror.png?raw=true)

### Delete Bucket

![D_BUCKET](https://github.com/koolhead17/test/blob/master/docs/screenshots/cyberduck/deletebucket.png?raw=true)

## Explore Further
* [Minio Client complete guide](https://docs.minio.io/docs/minio-client-complete-guide)
* [Cyberduck project homepage](https://cyberduck.io)


