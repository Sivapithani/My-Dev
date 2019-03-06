public class cntccontroller {
    
@auraEnabled
    public static void fetchContact(string AccountId){
        system.debug('id@@@'+AccountId);
       contact c =new contact ();
        c.lastName ='testfor Inset'+AccountId;
        c.AccountId =AccountId;
        Datetime mydate =system.now();
        mydate =mydate.addHours(2);
        c.Reported_Date__c =mydate;
        insert c;
    }
}