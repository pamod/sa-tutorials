##Overview

The section explains how to prepare EI instances to execute the samples described

##Set up file-paths

For the local file transfer samples, it would be essential to have some directories pre created.

Create following 3 directories in a desired location. An example is given below. 
In the examples this path would be referred as $SRC_DIRECTORY. 

**$SRC_DIRECTORY** - 
i.e <PATH>/source

This will hold the files which should be transferred, 
the transfer completed files would be dropped into the the destination directory

**$DST_DIRECTORY** - 
i.e <PATH>/destination 

Will hold the files which were processed.

##Set up broker

These examples will use ActiveMQ as the broker. In order to get details on how to setup ActiveMQ refer,
https://docs.wso2.com/display/EI640/Configure+with+ActiveMQ

Make sure that ActiveMQ is running on it's default port.
 
##Set up mail 

For this examples we would be using the email "sademo2019@gmail.com" as the mail to send/receive

##Set up database and data services

MySQL would be used as the database, 

- Create database with schema "warehouse"
- Locate the scripts under </setup/scripts> and apply them to warehouse

##Set up downstream service

Locate the service under <link> and start the service. This will mimic the restful service.

##Set up EI

These tutorials are based on EI 6.5.0

Folder which contains the EI distribution (EI HOME) would be referred as $EI_HOME

- Copy the content from <<link>> to $EI_HOME/lib and <<link>> to $EI_HOME/conf/axis2/
- Create carbon datasource named as "WarehouseDB" pointing to MySQL DB. 
(refer https://docs.wso2.com/display/EI640/Exposing+a+Carbon+Datasource+as+a+Data+Service for instruction on creating a datasource)
- Copy folder </setup/dataservices> to $EI_HOME/repository/deployment/server/ folder

###Testing the service

The following request would insert the values into the warehouse orders table

````
curl -X POST -d "@WareHouseDataInsertRequest.json" http://localhost:8280/services/WarehouseService/data -H "Accept: application/json" -H "Content-Type: application/json" -v
 
```` 

The request file could be found under /requests folder

The following request could be executed to query for a particular order.

````
curl -X GET http://localhost:8280/services/WarehouseService/data/{hmart} -H "Accept: application/json"  -v
````

  
##Integration Studio

In order to deploy the samples and modify them WSO2 integration studio could be used.



