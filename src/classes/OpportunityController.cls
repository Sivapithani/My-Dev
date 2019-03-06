public class OpportunityController {
   @AuraEnabled
    public static List<opportunity> getoppty(){
    List<Opportunity>   opptyList =[select Id,Name ,AccountID,Account.Name,CloseDate,Amount,StageName from Opportunity Limit 5];  
        return opptyList;
    }
}