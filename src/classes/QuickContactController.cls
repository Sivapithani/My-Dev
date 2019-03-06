public class QuickContactController {
    @AuraEnabled
    public static account getAccount(string accountID){
        Account acc=[select id ,name from Account where id=:accountID];
        return acc;
    }
    @AuraEnabled
    public static Contact saveContactWithAccount(id accountid ,contact newcontact){
        
        newcontact.AccountId=accountid;
        system.debug('newcontact@@@@@@@@@@@@@@@@@@@'+newcontact);
        upsert newcontact;
        return newcontact;
    }

}