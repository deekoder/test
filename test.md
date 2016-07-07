#another sample

<table>
    <thead>
        <tr>
            <th>Param</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
           obj
            </td>
            <td> Object</td>
            <td> object stat info for following format:
            <ul>
            <li>obj.size int: size of the object.</li>
            <li>obj.etag string: etag of the object.</li>
            <li>obj.content_type string: Content-Type of the object.</li>
            <li>obj.last_modified time.time: modified time stamp.</li>
            </ul>
            </td>
            </tr>
               </tbody>
</table>




__Parameters__



<table>
    <thead>
        <tr>
            <th>Param</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
           endPoint
            </td>
            <td>
            string
            </td>
            <td>
            endPoint is an URL, domain name, IPv4 or IPv6 address.
Valid endpoints:
                <ul>
                    <li>https://s3.amazonaws.com</li>
                    <li>https://s3.amazonaws.com/</li>
                    <li>https://play.minio.io:9000</li>
                    <li>http://play.minio.io:9010/</li>
                </ul>
            </td>
        </tr>
        <tr>
         <td>
           port
            </td>
            <td>
            string
            </td>
            <td>
            TCP/IP port number. This input is optional. Default value set to 80 for HTTP and 443 for HTTPs.
            </td>
        </tr>
    </tbody>
</table>


---------------------------------------
<a name="bucketExists">
#### bucketExists(bucketName, callback)
Checks if a bucket exists.

__Parameters__

| Param  | Type  | Description  |
|---|---|---|
| `bucketName`  |  _string_ | Name of the bucket.  |
| `callback(err)`  | _function_  | `err` is `null` if the bucket exists.  |
