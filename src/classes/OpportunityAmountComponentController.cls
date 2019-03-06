public class OpportunityAmountComponentController {

    @AuraEnabled
    public static void getOpportunityAmount(String oppId,string Amount){
        opportunity opp=[SELECT id,Amount FROM Opportunity WHERE Id=:oppId];
        opp.Amount =decimal.valueof(Amount);
        update opp;
    }

}