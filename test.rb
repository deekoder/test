require 'aws-sdk'
Aws.config.update(
        endpoint: 'http://localhost:9000',
        access_key_id: 'H5K8172RVM311Q2XFEHX',
        secret_access_key: '5bRnl3DGhNM+fRBMxOii11k8iT78cNSIfoqnJfwC',
        force_path_style: true,
        region: 'us-east-1'
)

rubys3_client = Aws::S3::Client.new

# put_object operation

rubys3_client.put_object(
        key: 'testobject',
        body: 'Hello from Minio!!\n',
        bucket: 'testbucket',
        content_type: 'text/plain'
)

# get_object operation

rubys3_client.get_object(
         bucket: 'testbucket', 
         key: 'testobject',
         response_target: 'download_testobject'
)

print "Downloaded 'testobject' as  'download_testobject'."
