#### FTP/File to JMS

Reads content from a file located in local directory and forward the content to queue.

###Pre-requisites 

- Make sure the environment is setup by following <link to setup>
- Locate the file FileTransferQueueInboundEndpoint.xml and QueueTransferFileSequence.xml 
and replace the file paths of /source and /destination with SRC_DIRECTORY and DST_DIRECTORY
file paths. 

###File to JMS

- Locate the file WarehouseOrderInput.json under requests and place it in the source directory 
- Navigate to ActiveMQ webconsole http://0.0.0.0:8161/admin/
- Browse for queues WarehouseOrders 
- A message with the relevant content should be present 

###JMS to File 

- Navigate to ActiveMQ webconsole http://0.0.0.0:8161/admin/
- Locate the queue WareHouseOrderQueue
- Chose the opetion Send-to and send the following payload 
{
"inventory":
  {
    "cust_id":"hmart", 
    "delivery":"addr1", 
    "contact":"784-7948754", 
    "item":"A200", 
    "quantity":120
 }
}
- Navigate to destination folder. 
- A file named "A200" with the relevant content would be present.





