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
            string cust = payload.cust_id != ()? payload.cust_id.toString() : "";
            string item = payload.item != ()? payload.item.toString() : "";
            string delivery = payload.delivery != ()? payload.delivery.toString() : "";
            string contact = payload.contact != ()? payload.contact.toString() : "";
            int|error quantity = int.convert(payload.quantity);
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

    // {"cust_id":"hmart", "item":"A200", "spec":"a200-v2.pdf"}
    resource function customizations(http:Caller caller, http:Request request) {
        io:println("ABC - Customization received");
        if (request.hasHeader("X-JWT-Assertion")) {
            string jwt = request.getHeader("X-JWT-Assertion");
            log:printInfo("JWT:" + jwt);
        }

        json responsePayload = ();
        var payload = request.getJsonPayload();
        if (payload is json) {  
            string cust = payload.cust_id != ()? payload.cust_id.toString() : "";
            string item = payload.item != ()? payload.item.toString() : "";
            string spec = payload.spec != ()? payload.spec.toString() : "";
            if (item != "") {
                log:printInfo("Customization accepted for Item: " + item + ", spec: " + spec);
                responsePayload = {status: "Customization recorded", customizationData:{item:item, spec:spec}};
            } else {
                log:printError("Error in extracting customization attributes.");
            }       
        } else {
            log:printError("ERROR", err = payload);
        }

        http:Response res = new;
        res.statusCode = 200;
        if (responsePayload == ()) {
            responsePayload = {errorMsg:"Error in processing customization reqeust."};
            res.statusCode = 400;
        }
        res.setJsonPayload(untaint responsePayload);
        var status = caller->respond(res);
    }

    resource function add(http:Caller caller, http:Request request) {
        io:println("Add request");
        if (request.hasHeader("X-JWT-Assertion")) {
            string jwt = request.getHeader("X-JWT-Assertion");
            log:printInfo("JWT:" + jwt);
        }

        json responsePayload = ();
        var payload = request.getJsonPayload();
        if (payload is json) {  
            string item = payload.item != ()? payload.item.toString() : "";
            int|error price = int.convert(payload.price);
            if (price is int && item != "") {
                log:printInfo("Added Item: " + item + " added with price: " + price);
                responsePayload = {action: "Add_item", item:{name:item, price:price}};
            } else {
                log:printError("Error in extracting item attributes.");
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

    resource function list(http:Caller caller, http:Request request) {
        io:println("List request");

        if (request.hasHeader("X-JWT-Assertion")) {
            string jwt = request.getHeader("X-JWT-Assertion");
            log:printInfo("JWT:" + jwt);
        }
        
        http:Response res = new;
        res.statusCode = 200;
        json responsePayload = [{item:"A100", price:200}, {item:"A200", price:240}];
        res.setJsonPayload(responsePayload);
        var status = caller->respond(res);
    }
}
