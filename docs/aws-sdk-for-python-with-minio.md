# How to use AWS SDK for Python with Minio Server [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

`aws-sdk-php` is the official AWS SDK for the PHP programming language. In this recipe we will learn how to use `aws-sdk-php` with Minio server.


## 1. Prerequisites

Install Minio Server from [here](http://docs.minio.io/docs/minio).
 
## 2. Installation

Install `aws-sdk-python` from AWS SDK for Python official docs [here](https://aws.amazon.com/sdk-for-python/) 


## 3. Example

Please replace ``endpoint_url``,``credentials``, ``Bucket`` and ``Object`` with your local setup in this ``example.py`` file.

Example below shows upload and download object operations on Minio server using aws-sdk-python.


```python

#!/usr/bin/env/python
import boto3
from botocore.client import Config


s3 = boto3.resource('s3',
                    endpoint_url='http://localhost:9000',
                    aws_access_key_id='H5K8172RVM311Q2XFEHX',
                    aws_secret_access_key='5bRnl3DGhNM+fRBMxOii11k8iT78cNSIfoqnJfwC',
                    config=Config(signature_version='s3v4'),
                    region_name='us-east-1')




# Upload an Object to Bucket.
s3.Bucket('testbucket').upload_file('testobject', 'testobject')

#Download an object from Bucket.
s3.Bucket('testbucket').download_file('testobject', 'download_testobject')

print "Downloaded 'testobject' as  'download_testobject' "

```


## 4. Run the Program

```sh
$ python example.py
downloaded testobject as  download_testobject locally.
```
## 5. Explore Further

* [Minio Python Library for Amazon S3](https://docs.minio.io/docs/python-client-quickstart-guide)
