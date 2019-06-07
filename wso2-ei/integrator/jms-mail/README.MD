#### JMS/Email 

Read content from mail and send to JMS queue and vice versa.

###Pre-requisites 

- Make sure the environment is setup by following <link to setup>

###Email to JMS 

- Send an email to sademo2019@gmail.com in the text/plain mode
- The email body could be the following 
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
- login to ActiveMQ management console and observe an entry been created under the queue MailOrders

###JMS to Email

- Navigate to ActiveMQ management console and locate the queue MailOrderQueue
- Using the sentTo message option send the following message 
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
- based on the current configuration a mail would be dispatched to 'synapse.demo.0@gmail.com' change the mail address in QueueTransferEmailSequence to receive the content to different address








