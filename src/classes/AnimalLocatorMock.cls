global class AnimalLocatorMock  implements Httpcalloutmock {
    
    global HttpResponse respond(Httprequest request){
        HttpResponse response =new HttpResponse();
        response.setHeader('content-type', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        
        return response;
    }

}