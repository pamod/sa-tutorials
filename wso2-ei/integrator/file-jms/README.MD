#### FTP/File to JMS

The sample demonstrate how to integrate between FTP to JMS queue system

###Prerequesites 

- The following folders should be created

To read file which contains a warehouse order request and dispatch to the queue
/Users/pamod/Desktop/demo/sa-tutorials/wso2-ei/integrator/file-ops/source

- To read the content from queue and store it in the relevant destination
/Users/pamod/Desktop/demo/sa-tutorials/wso2-ei/integrator/file-ops/destination

- Make sure JMS broker is running. For this example we'll be using ActiveMQ. In order to configure and run ActiveMQ broker follow the instructions in 
https://docs.wso2.com/display/EI640/Configure+with+ActiveMQ
- Ensure that EI is downloaded and started 
- Deploy MessagingConfigProjectCompositeApplication

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





