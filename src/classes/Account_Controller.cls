public class Account_Controller {
 @AuraEnabled   public List<Account> acclist{get; set;}
    public integer rowcount {get; set;}
    public Account_Controller(ApexPages.StandardController controller){
        acclist =[select id,name,phone ,rating from Account];
        rowcount =6;
    }
}