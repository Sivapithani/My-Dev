public class listOfSobjectController {
    public List<string> allObjects{get;set;}
   // public List<account> acc{get; set;}
    public listOfSobjectController(){
        allObjects =new List<string>();
       for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values())
       {
           if(objTyp !=null)
           {
               allObjects.add(objTyp.getDescribe().getLabel());
               system.debug('****-->'+ objTyp.getDescribe().getLabel()); 
           } 
		} 
         //acc =[select id,name from Account limit 10];
        system.debug('****Size'+ allObjects.size()); 
    }
}