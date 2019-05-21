#### JMS/Email 

The sample demonstrate how to integrate between queue based systems via JMS and with mail systems

###Prerequesites 

- The following folders should be created

- Make sure JMS broker is running. For this example we'll be using ActiveMQ. In order to configure and run ActiveMQ broker follow the instructions in 
https://docs.wso2.com/display/EI640/Configure+with+ActiveMQ
- Make sure the following mail sender/receiver is enabled in axis2.xml
    <transportReceiver name="mailto" class="org.apache.axis2.transport.mail.MailTransportListener">
    </transportReceiver>

   <transportSender name="mailto" class="org.apache.axis2.transport.mail.MailTransportSender">
        <parameter name="mail.smtp.host">smtp.gmail.com</parameter>
        <parameter name="mail.smtp.port">587</parameter>
        <parameter name="mail.smtp.starttls.enable">true</parameter>
        <parameter name="mail.smtp.auth">true</parameter>
        <parameter name="transport.mail.Format">Text</parameter>
        <parameter name="mail.smtp.user">sademo2019</parameter>
        <parameter name="mail.smtp.password">sa@wso2.com</parameter>
        <parameter name="mail.smtp.from">sademo2019@gmail.com</parameter>
    </transportSender>
- Ensure that EI is downloaded and started 
- Deploy MailExchangeConfigProjectCarbonApplication

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








