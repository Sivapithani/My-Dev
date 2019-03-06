public class Opptytabelcontroller {
 @AuraEnabled
    public static void getOpportunityAmount(String oppId,string MCompetitor){
        system.debug('opp@@@@@'+MCompetitor);
        opportunity opp=[SELECT id,DB_Competitor__c,MainCompetitors__c,OrderNumber__c,TrackingNumber__c FROM Opportunity WHERE Id=:oppId];
        //opp.DB_Competitor__c =Competitor;
        opp.MainCompetitors__c =MCompetitor;
        //opp.TrackingNumber__c =TNumber;
        //opp.OrderNumber__c =ONumber;
        update opp;
        system.debug('opp@@@@@'+opp);
    }
     @AuraEnabled
    public static opportunity getOpportunity(String oppId){
        opportunity opp=[SELECT id,DB_Competitor__c,MainCompetitors__c,OrderNumber__c,TrackingNumber__c FROM Opportunity WHERE Id=:oppId];
        
        return opp;
    }

}