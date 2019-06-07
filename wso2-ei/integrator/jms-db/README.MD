#### JMS/Email 

Read content from queue and insert into database and vice versa

###Pre-requisites 

- Make sure the environment is setup by following <link to setup>

###JMS to Database 

- Navigate to ActiveMQ management console, send the following message to queue WareHouseOrderQueue

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


- Check the database and notice an entry been created 

###Database to JMS 

- Using curl client invoke the following service 

 curl -X POST http://localhost:8280/warehouse/transfer/hmart -H "Accept: application/json"  -v

 - Navigate to ActiveMQ management console and notice a message placed in the queue WarehouseOrders
