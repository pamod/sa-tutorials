#### Database/Email 

Sample illustrates how a message could be read 

###Prerequesites 

- Make sure WSO2 EI is configured to integrate with MySQL DB. Please follow the instructions to setup EI
https://docs.wso2.com/display/EI640/Generating+a+Data+Service#GeneratingaDataService-Step1:Settingupadatasource
- Make sure the mail sender/receiver is enabled 
- Create a database "warehouse" and execute the following warehouse_tbl_orders.sql
- Generate services for the tbl_orders
- Following request could be invoked to test the dataservice 

To test insertion of the values 

curl -X POST -d "@WareHouseDataInsertRequest.json" http://localhost:8280/services/WarehouseService/data -H "Accept: application/json" -H "Content-Type: application/json" -v

Query order from key

curl -X GET http://localhost:8280/services/WarehouseService/data/{hmart} -H "Accept: application/json"  -v

WareHouseDataInsertRequest.json could be found under /requests 

- Deploy the Capp <<Capp Name>>
- Make sure a record is inserted into the db. 
- Ensure that the /destination directory is created 

i.e /Users/pamod/Desktop/demo/sa-tutorials/wso2-ei/integrator/file-ops/destination/

###Database to File (reliable delivery)

- Using curl client invoke the following service 

curl -X POST http://localhost:8280/warehouse/transfer/hmart -H "Accept: application/json"  -v

- Navigate to /destination directory and observe the relevant inventory file being created 


