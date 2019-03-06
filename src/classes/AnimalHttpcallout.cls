@istest
global class AnimalHttpcallout implements Httpcalloutmock {
    global Httpresponse respond(Httprequest request){
      Httpresponse response =new Httpresponse();
        response.setHeader('content-type','application/json');
        response.setStatusCode(200);
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
     return response;   
    }

}