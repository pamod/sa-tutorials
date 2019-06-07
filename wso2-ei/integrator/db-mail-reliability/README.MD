#### Database/Email 

Retrieve message from database and dispatch the content to the specified mail address

###Pre-requisites 

- Find the configuration WarehouseOrders.xml and replace the email "synapse@wso2.com"
- Deploy the Capp <<Capp Name>>
- Make sure a record is inserted into the db. 

###Database to Email (reliable delivery)

- Using curl client invoke the following service 

 curl -X POST http://localhost:8280/warehouse/transfer/hmart -H "Accept: application/json"  -v
