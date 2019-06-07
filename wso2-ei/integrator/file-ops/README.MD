###File Transfer Samples

Transfer http content to file and vice versa.

####Prerequisites
 
- Make sure the environment is setup by following <link to setup>

#### File to HTTP

This sample illustrates how a files content could be processed and forwarded to downstream service 
(warehouse management)

Copy the file ./requests/files/WarehouseOrderInput.json into source directory

The following would be prompted in the warehouse management service

ABC - Order received
2019-05-17 10:22:33,762 INFO  [] - 
Order placed for Item: A100, quantity: 120. Deliverary to: addr1. Contact: 784-7948754


#### File Batch Request to HTTP

Copy the file ./requests/files/WarehouseOrderBatchInput.json to batch directory. 

The following two logs will be prompted in the warehouse management service

ABC - Order received
ABC - Order received
2019-05-17 10:54:38,057 INFO  [] - Order placed for Item: A100, quantity: 120. Deliverary to: addr1. Contact: 784-7948754
2019-05-17 10:54:38,057 INFO  [] - Order placed for Item: A123, quantity: 400. Deliverary to: addr2. Contact: 784-748484

#### HTTP to File 

This sample illustrate how a file could be created from a HTTP service 

Send the following http request 

curl -X POST -d "@FileInboudRestRequest.json" http://localhost:8280/warehouse -H "Content-Type: application/json" -v

Navigate to destination directory. Notice a file entry being created along with the request content.


#### HTTP Batch Request to File

This sample illustrate how a file could be created from a HTTP service 

Send the following http request 

curl -X POST -d "@FileInboudBatchRestRequest.json" http://localhost:8280/warehouse/batch -H "Content-Type: application/json" -v

Navigate to destination directory. Notice a file entry being created along with the request content.