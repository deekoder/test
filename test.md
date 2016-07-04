__Parameters__


| Param | Type| Description |
| ---- | ---- | ---- |
| `endPoint` | _string_ |INSERT HERE|
| `port` |_string_   |TCP/IP port number. This input is optional. Default value set to 80 for HTTP and 443 for HTTPs. |
|`accessKey` | _string_| accessKey is like user-id that uniquely identifies your account. | 
| `secretKey` | _string_ | secretKey is the password to your account. |
| `secure` | _bool_ | If set to true, https is used instead of http. Default is https if not set. | 

add: https://docs.minio.io/docs/javascript-client-api-reference **Parameters** contents above.


---------------------------------------
<a name="bucketExists">
#### bucketExists(bucketName, callback)
Checks if a bucket exists.

__Parameters__

| Param  | Type  | Description  |
|---|---|---|
| `bucketName`  |  _string_ | Name of the bucket.  |
| `callback(err)`  | _function_  | `err` is `null` if the bucket exists.  |
