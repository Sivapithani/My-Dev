public class AnimalLocator {
    //public 
    public static string getAnimalNameById(integer id){
       
        Http http= new Http();
        HttpRequest request =new HttpRequest();
        request.setMethod('GET');
        //string endpointUrl='https://th-apex-http-callout.herokuapp.com/animals/'+Id;
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
        httpresponse response =http.send(request);
         List<Object> animals; 
       String returnValue; 
        if(response.getstatuscode()==200){
            map<string ,object>results =(map<string ,object>) JSON.deserializeUntyped(response.getBody());
             animals =(list<object>)results.get('Animal');
           
           }
        if(animals !=null && animals.size()>0 && id<animals.size() ){
            returnValue = (string)animals.get(id);
        }
        
        return returnValue;
    }
}