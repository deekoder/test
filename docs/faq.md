### General FAQ

 ##### What is Minio?
 Minio is an open source cloud storage. You can see it as an alternative to Amazon S3. Like all cloud storage Minio has three components to it: Server, Client and Libraries. ‘mc’  mc is a client utility to use cloud storage. With Minio, application developers can build their own Amazon S3 compatible cloud storage. Minio can run on laptops or servers or VMs or containers. In a real production environment it will be a server with lots of disks JBODS.

##### Where can I find more documentation?
Minio oficial documentation is hosted at [docs.minio.io](https://www.docs.minio.io)
 
 ##### How can I help?
 You can contribute to Minio project in many ways:
 * ``developers`` : Fork our project on Gihub and start contributing with code. Minio is mostly written in Golang but we have our client libraries avaibale in other language like Python, Java, NodeJS as well.
 * ``File a bug``: Try out our software, report issues you have faced & we will be more than happy to fix it for you.
 * ``Writers``: Give us your feedback on our  [docs.minio.io](https://www.docs.minio.io) also write about us in popular posts, blogs or on your personal blog about us.
 * ``Translators``: Love Minio, why not helping us with writing our documenats in your local language.
 * ``Local Leaders``: We would love to have you speak, present, talk in behalf of Minio community at regional conferences & events. You need to have great understanding of our project.
 
##### Can I make a donation to Minio project?
No, we don't need any donation. All we need is your contribution to the project and some love.

### Legal FAQ

##### What is license of Minio?
Minio is released under Apache license 2.0.

##### Is there any difference between commercial and community version of Minio?
No

#####  Can I distribute Minio?

##### Can I sell Minio software?

##### Who holds the copyright and trademark for Minio?

##### Do you offer commercial dual license?
No

### Minio Client (mc) FAQ

##### What is mc?
``mc`` aka Minio Client provides minimal tools to work with Amazon S3 compatible cloud storage and filesystems. It has features like resumable uploads/downloads, progress bar, mirroring etc. mc is written in golang and released under Apache license v2.

##### Where can I download mc?
You can download ``mc`` from [https://minio.io/download](https://minio.io/download/)

##### Can you list some Amazon S3 compatible cloud storage providers?
Ceph, Swift are some other known providers apart from Minio.

##### Are there other alternatives to mc?
Minio supports alternative clients as well with limited functionalities. Refer to   [Minio AWS-CLI ](https://docs.minio.io/docs/aws-cli-with-minio-server)  & [Minio S3cmd](https://docs.minio.io/docs/s3cmd-with-minio-server) docs for more.  

### Extra questions on mc client section >>>>

##### I am not able to copy my directory to bucket.
As per object Storage mechanism you can only add files inside bucket, directory structure is not supported. 
To copy content of entire directory to remote bucket use ``mc mirror`` command, check [Minio Client Complete Guide](https://docs.minio.io/docs/minio-client-complete-guide) for more information.  

##### Will my config file get affected if I upgrade my mc via ``go get -u github.com/minio/mc`` ?
No, all of minio code is designed to automatically upgrade any of its config file or internal state files to newer format. So you are safe. :)

##### Is there a way to add global configuration for mc commands inside the config file?
No, We prefer not doing so. The mc config file is limited to keep information about multiple hosts.  The best way is to have an alias in your ``.bashrc``

##### Why mc share has no option for number of days but hours, minutes and second?
Golang doesn't have a way to specify ``days`` on CLI. So we have to provide hours.

##### What is the best way to learn minio client operations easily and quickly?
Best way to learn is by deploying and playing with it. You can follow [https://docs.minio.io/docs/minio-client-complete-guide](https://docs.minio.io/docs/minio-client-complete-guide) for same.

##### Can we modify HTTP Cache headers via mc?
No, at this point we do not.

#####  I am trying to delete & create a bucket with same name on AWs S3 using ``mc`` client. At times I end up getting error like ``Your previous request to create the named bucket succeeded and you already own it.`` 
That is because S3 is sending that error back. Your bucket is already created
You are using same bucket 'kline' all the time I guess. 
Removal of bucket on S3 is not an atomic operation.
Since it's part of DNS it takes time for them to be propagated

##### Does ``mc`` supports multiple AWS account configuration and operation in single config file?
Yes, for the same you will have to assign account canonical name associated with secret/access key details. Check [Minio Client Complete Guide
](https://docs.minio.io/docs/minio-client-complete-guide) for more.

##### Are the multipart upload supported in ``mc`` is parallel in nature?
No, we support serial multipart upload. There was a tradeoff between data integrity and speed, we selected integrity of data over speed. :)

##### ``mc cat`` operations run remotely or locally?
The object is fetched locally in realtime from server & content is splashed on the screen.

##### Can i see incomplete object uploads via  ``mc``?
Yes you can, use `` $ mc ls -I`` command with bucketname you would like to investigate. 

##### How ``mc`` guarantees than the object uploaded from local system to S3 maintains its sanity and not corrupt? {need to confirm}
``mc`` does a md5 and sha256 to check the integrity of the file. 


### Minio Server FAQ
##### What is Minio?

#####  What is Microstorage architecture?

##### What kind of security policy are supported in Minio Server?
Minio does not support ACL but we do support limited  AWS bucket policy. Check [Minio Server Bucket policy](https://docs.minio.io/docs/minio-server-bucket-policy) for details.

##### What is Erasure Coding?

##### Why is Minio written in Golang?

##### What is the maximum size of an object?
It will be same as AWS S3, 5TB
##### What is the maximum number of objects I can store in a bucket?

##### What is the maximum size of bucket?

##### What is the maximum number of buckets I can create?

##### What is the maximum number of servers Minio can scale to?

##### How does it compare to OpenStack Swift?
Minio's is built to handle your Object Storage infrastructure in microstorage architecture which is key to fast pace application development. Swift is also an object storage.. it is uses its own Swift API (not S3).

##### How does it compare to Red Hat GlusterFS?
Minio is Object Storage while GlusterFS is block storage, they are both supposed to solve two different storage oppertunities. 

##### How does it compare to Red Hat Ceph?
Ceph wants to be file, block and object. We will be only object and S3 only not even Swift API. Minio is S3 API v4 signature. Latest having a simpler objective allows Minio to be simple. simplicity is key to scalability
Another confusion, Industry has is.. definition of Object storage from Panasas, Lustre to Ceph. They build object oriented block store loosely use that definition to compare to object storage.

##### What operating systems and architecture does Minio support?

##### How does it compare to Amazon S3, Google Cloud Storage and Microsoft Blob Storage?
Minio provides most of the features provided by these Object storage providers &  it supposts Amamzon S3 version4 signatures.One can run his/her own buisness using Minio and compete against the above mentioned providers. 

##### Is there a hosted version of Minio server like Amazon S3 service?
No

##### Can I run Minio on a Docker container?
Yes, you can. All you need is pull our Minio Server image from Docker hub.
```
$ docker pull minio/minio
```
Head over to our Minio-Docker [doc](https://docs.minio.io/docs/minio-docker-container) for more detials.

##### Is there a recommended hardware configuration for Minio server?

##### Does Minio server support object and bucket encryption?
No, we do not.

## Extra added questions on minio server >>>>

##### Is Minio recommended for hosting static website?
No, Minio is not recommended for static website.


##### What is Minio prospective to object storage benchmarking?
Some key points:
        * Minio  protects with checksum at protocol level your data is safe on us.
        * Ease of usability, single binary run anywhere, multi platform - run it on windows, osx, linux and bsd's, Signature V4 compatible with S3 API.
        * No dependencies, minimal workflow  for deployment
        * Minio’s SDK's written from scratch to be simple and easy to adopt Object Storage.
        * Minio Client aka mc provides everything needed to copy large amount of data.
        * Last not the least you are not locked in to us with anything, all you need is minio client to migrate everything to AWZ S3 or GCP with single command.

##### Is there a way to check integrity of binary/packages I am downloading from minio repository?
Yes, we provide minio.shasum for all the packages, check  [https://dl.minio.io/server/minio/release/](https://dl.minio.io/server/minio/release/) for details. 

##### Can i import minio server access and secret key in my environment variable?
Yes, you can with below mentioned steps, just by adding minio server credetials 
```
export MINIO_ACCESS_KEY=""
export MINIO_SECRET_KEY=""
```

##### Is 3rd party tool like ``s3cmd`` is supported for minio server?
Yes, it is supported but we will recommend our users to use ``mc`` & its client libraries.

##### Does Minio (non-XL) version has native replication in-built?
 No, it is not in-built but one can run ``mc`` aka minio client on the server side
with ``mc mirror`` running at backend as cron job.

##### Is there a way to create and compare SHA checksums between the copies on minio server & on the local?
At this moment we do not because we do multipart upload (i.e upload part by part) so that we can resume failed downloads, if we do one shot upload which is not resumable then the ``ETAG`` of the file uploaded indicates md5sum.

##### Does minio-server support AWS signature version2?
No, we are support AWS signature version4.

##### Does minio supports something like AWS Lambda?
No, we do not at this point.

##### Is there md5sum available for objects in minio, can we retrive it using ``HEAD`` request?
Right now we are not keeping the md5sum for minio/minio. The reason to not save this information was that minio server can be run on existing directories and files locally. Avoids us to compute md5 of all files and generate metadata during a first time run.
Although incoming data is verified if the request has Content-MD5 header - as valid digest and matching content for any corruption.
minio/minio-xl - the distributed version will have those metadata in place for future queries.

##### Is there a way  to create new credentials of minio server through the API?
No it is not possible, it is a single credential per instance. If you delete the config file it will regenerate it.

##### If I need to run more then one minio-server on the same instance could I set the "config" directory on each process? 
Yes, you will need to provide saperate port & config directory for the instance with ``--address`` & `` --config-dir`` flag. Check [Minio Client Complete Guide
](https://docs.minio.io/docs/minio-client-complete-guide) for more.

##### Does minio microservice supports object versioning? 
No, at this point we do not.

##### What firewall configurations I will have to enable if I am running Minio Server on other cloud providers and want to access it behind office firewall?
Minio server by default uses port 9000, so you will need to have the port enabled for communication.

#####  Is Minio POSIX compliant?
Minio is built for Object Storage solution & hence we are not supporting that.

##### Why can i not add bucketname as capital & camelcase?
Minio does not support camelcase or Capital letters in naming convention.

##### What filesystems Minio supports?
Minio is built to support all the native OS level file system be it EXT4 on Linux to NTFS on Windows. But as a recommendation when you are building large cluster using XFS will be a good idea.

##### Can I run Minio with SSL certificates?
Yes, the opetarions done on Minio server for storing and retiving objects are ``https`` supported. Refer to [Generate Let's Encypt certificate using Concert for Minio](https://docs.minio.io/docs/generate-lets-encypt-certificate-using-concert-for-minio) doc for same.

##### Does Minio supports fine grained object policy?
No, objects inherit the access properties from their bucket.

##### Is there a way to run minio server as a daemon?
Yes, just run it as a background process. Keep things simple.

##### Why Minio server does not implement TLS by default?
We follow simplicity, by keeping TLS by default user needs to pass certificates even if we do letsencrypt, we need to ask email address and generate a certificate
first time users often don’t understand certificates.

##### How can I benchmark minio XL?
Object storage has 3 prime pieces: http server, internet &  disc you are storing your unstructured data. Minio takes care of the RESt/http/https part & you have to make sure that you have a good internet connection & storage hardware. With falling cost of hardware we won’t be surprised to see that a lot of our customers and users are adopting solid state driver. 
         So in simple terms providing a benchmark will be difficult because unlike older storage system NAS/SAN/filesystem Object storage is a totally different beast altogether.


### Minio SDK FAQ

##### What minio client and SDK libraries of minio still supports AWS signature version 2.
Minio client aka ``mc`` and ``minio-go`` library supports AWS  signature v2

##### What language bindings are currently available for Minio APIs?
Minio currently supports Golang, NodeJs, Java and Python language bindings.

##### Can I use Amazon AWS SDK to communicate with Minio Server?
Yes, you can but with few limitations. We will actively encourage you to use Minio client instead.

##### Can I use Minio SDK to communicate with Amazon S3 Service?
Yes, you can.

##### Can I use Minio SDK to communicate with Google Cloud Storage?

##### Why did you develop Minio SDK when Amazon SDK is already mature?

##### Is there any plan to support more languages?
Yes, we are in process of releasing language support for other SDK as well. At same time

## Extra added questions on minio SDK section >>>

##### Tell us in details about minio-go library & various object storage access it supports. 
List of supported cloud storage providers.
* AWS Signature Version 4
   * Amazon S3
   * Minio
* AWS Signature Version 2
  * Google Cloud Storage (Compatibility Mode)
  * Openstack Swift + Swift3 middleware
  * Ceph Object Gateway
  * Riak CS

 we would love to get community participation as well, pull request is always welcome. :)
