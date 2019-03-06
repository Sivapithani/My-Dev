@istest
Private class Animalcallouttestcalss {
    @istest static void testGetcallout(){
        /*StaticResourcecalloutMock mock =new StaticResourcecalloutMock();
        
        mock.setStaticResource('GetAnimalResource');
        mock.setstatuscode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
       Test.setMock(HttpCalloutMock.class, mock); */
        
        Test.setMock(HttpCalloutMock.class, new AnimalHttpcallout()); 
         HttpResponse result = Animals.getanimals();


    }

}