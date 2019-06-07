#### Database/Email 

Read warehouse data from database, place it in a queue and dispatch the content to file

###Prerequesites 

- Make sure the environment is setup by following <link to setup>
- Make sure a record is inserted into the db, insertion of record is elaborated 
in the setup instructions. 
- In EI synapse configuration, update the $DST_DIRECTORY path specified in 
WarehouseOrders.xml
- Deploy the Capp <<Capp Name>>

###Database to File (reliable delivery)

- Using curl client invoke the following service 

curl -X POST http://localhost:8280/warehouse/transfer/hmart -H "Accept: application/json"  -v

- Navigate to /destination directory and observe the relevant inventory file being created 


