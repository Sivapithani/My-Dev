public class Animals {
    
    Public static httpresponse getanimals(){
        Http http = new Http();
        HttpRequest request =new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        HttpResponse response =http.send(request);
        if(response.getstatuscode()==200){
            Map<string,sobject> results=(Map<string,sobject>) JSON.deserializeUntyped(response.getbody() );
            
        }
        
        return response;
    }

}