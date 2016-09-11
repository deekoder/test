# How to use AWS SDK for Javascript with Minio Server [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

`aws-sdk` is the official AWS SDK for the Javascript programming language. In this recipe we will learn how to use `aws-sdk` for Javascript with Minio server.

## 1. Prerequisites

Install Minio Server from [here](http://docs.minio.io/docs/minio).
 
## 2. Installation

Install `aws-sdk` for Javascript from the official AWS Javascript SDK docs [here](http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/) 

## 3. Example

Please replace ``endpoint``,``accessKeyId``, ``secretAccessKey``, ``Bucket`` and ``Object`` with your local setup in this ``example.rb`` file.

Example below shows put_object() and get_object() operations on Minio server using `aws-sdk `.

```javascript
var AWS = require('aws-sdk');

var s3  = new AWS.S3({
          accessKeyId: 'YOUR-ACCESSKEYID' ,
          secretAccessKey: 'YOUR-SECRETACCESSKEY' ,
          endpoint: 'http://127.0.0.1:9000' ,
          s3ForcePathStyle: 'true', // needed with minio?
          signatureVersion: 'v4'
                                });



// putObject operation

var params = {Bucket: 'testbucket', Key: 'testobject', Body: 'Hello from Minio!!'};

  s3.putObject(params, function(err, data) {

      if (err)

          console.log(err)

      else       console.log("Successfully uploaded data to myBucket/myKey");

   });

# get_object operation



```

## 4. Run the Program

```sh
$ node example.js
Downloaded 'testobject' as  'download_testobject'.
```
## 5. Javascript Shopping App

* [Javascript Shopping App](https://docs.minio.io/docs/javascript-shopping-app)
