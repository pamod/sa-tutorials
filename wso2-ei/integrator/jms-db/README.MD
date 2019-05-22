#### JMS/Email 

Sample illustrates usage of JMS with DB

###Prerequesites 

- Make sure JMS broker is running. For this example we'll be using ActiveMQ. In order to configure and run ActiveMQ broker follow the instructions in 
https://docs.wso2.com/display/EI640/Configure+with+ActiveMQ. Also make sure JMS sender/receiver is enabled 
- Make sure WSO2 EI is configured to integrate with MySQL DB. Please follow the instructions to setup EI
https://docs.wso2.com/display/EI640/Generating+a+Data+Service#GeneratingaDataService-Step1:Settingupadatasource
- Create a database "warehouse" and execute the following warehouse_tbl_orders.sql
- Generate services for the tbl_orders
- Following request could be invoked to test the dataservice 

To test insertion of the values 

curl -X POST -d "@WareHouseDataInsertRequest.json" http://localhost:8280/services/WarehouseService/data -H "Accept: application/json" -H "Content-Type: application/json" -v

Query order from key

curl -X GET http://localhost:8280/services/WarehouseService/data/{hmart} -H "Accept: application/json"  -v

WareHouseDataInsertRequest.json could be found under /requests 

###JMS to Database 

- Navigate to ActiveMQ managment console, send the following message to queue WareHouseOrderQueue

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
