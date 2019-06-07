import ballerina/http;
import ballerina/log;
import ballerina/io;

// RESTful service.
@http:ServiceConfig { basePath: "/warehouse" }
service abc_warehouse on new http:Listener(8090) {

    // {"cust_id":"hmart", "delivery":"addr1", "contact":"784-7948754", "item":"A100", "quantity":120}
    @http:ResourceConfig {
        methods: ["POST"],
        path: "/order"
    }
    resource function orders(http:Caller caller, http:Request request) {
        io:println("ABC - Order received");
        if (request.hasHeader("X-JWT-Assertion")) {
            string jwt = request.getHeader("X-JWT-Assertion");
            log:printInfo("JWT:" + jwt);
        }

        json responsePayload = ();
        var payload = request.getJsonPayload();
        if (payload is json) {  
            string cust = payload.inventory != ()? payload.inventory.cust_id.toString() : "";
            string item = payload.inventory != ()? payload.inventory.item.toString() : "";
            string delivery = payload.inventory != ()? payload.inventory.delivery.toString() : "";
            string contact = payload.inventory != ()? payload.inventory.contact.toString() : "";
            int|error quantity = int.convert(payload.inventory.quantity);
            if (quantity is int && item != "") {
                log:printInfo("Order placed for Item: " + item + ", quantity: " + quantity + ". Deliverary to: " + delivery + ". Contact: " + contact);
                responsePayload = {status: "Items ordered", orderData:{item:item, quantity:quantity, delivery:delivery, contact:contact}};
            } else {
                log:printError("Error in extracting order attributes.");
            }       
        } else {
            log:printError("ERROR", err = payload);
        }

        http:Response res = new;
        res.statusCode = 200;
        if (responsePayload == ()) {
            responsePayload = {errorMsg:"Error in processing add reqeust."};
            res.statusCode = 400;
        }
        res.setJsonPayload(untaint responsePayload);
        var status = caller->respond(res);
    }
}
