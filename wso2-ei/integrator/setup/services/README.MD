##Warehouse Management Service

###Prerequisites

1. Ensure that Ballerina is installed and configured, 
installation instructions could be found in https://ballerina.io/learn/getting-started/

###Starting the service

execute the following command in the directory where the file 'abc_warehouse.bal' is present

**ballerina run abc_warehouse.bal**

The following logs will be printed to indicate successful execution of the service  

**Initiating service(s) in 'abc_warehouse.bal'
[ballerina/http] started HTTP/WS endpoint 0.0.0.0:8090**

###Testing the service

The service should be tested by sending the following request 

curl -X POST -d "@FileInboudRestRequest.json" http://localhost:8090/warehouse/order 
-H "Content-Type: application/json"

File @FileInboudRestRequest.json would contain the following,

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