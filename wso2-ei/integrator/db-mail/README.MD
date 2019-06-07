#### Database/Email 

Reads warehouse data from database and dispatch a mail.

###Pre-requisites 

- Make sure the environment is setup by following <link to setup>
- Make sure a record is inserted into the db, insertion of record is elaborated 
in the setup instructions. 
- Find the configuration EmailTransferSequence.xml and replace the email "synapse@wso2.com"
with the relevant email that you wish to receive the notification.
- Deploy the Capp <<Capp Name>>

###Database to Email 

- Using curl client invoke the following service 

 curl -X POST http://localhost:8280/warehouse/transfer/hmart -H "Accept: application/json"  -v

- log into the mail and notice the mail in the inbox.


### Multiple Datasource to Mail

- Using curl client invoke the following service 

curl -X POST http://localhost:8280/details/hmart -H "Accept: application/json"  -v

- Check mail to preview aggregated results