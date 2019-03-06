public class ContactController {
@AuraEnabled
    Public static List<contact> getAllContacats(){
        List<contact> contactList =[select Id,LastName,FirstName,Phone,Email,Leadsource,MailingStreet From contact where (LastName !=null And FirstName !=null and Phone !=null and Email !=null) limit 1];
            return contactList;
 
    }
    @AuraEnabled
    public static Contact createcontact(string lastname, string firstname ,string email,string birthdate){
        system.debug('birth@@ :'+birthdate);
        contact con = new contact();
        con.LastName =lastname;
        con.FirstName=firstname;
        con.Email =email;
        con.Birthdate =date.valueof(birthdate);
        con.RecordTypeId ='0120I0000019aAzQAI';
        con.AccountId ='0010I00001qQCuUQAW';//taccount.id;
        insert con;
        system.debug('con.id'+con.id);
        return con;
    }
    @AuraEnabled
    public static string getServiceName(string serviceId){
        contact conobj =[select id,FirstName,LastName from contact where id=:serviceId];
        return conobj.FirstName+''+conobj.LastName ;
        
    }
    @AuraEnabled
    public static  List<Fulfillment__c> getactivity(string contactid){
        Activity__c actobbj =[select id,Name from Activity__c where ContactList__c=:contactid];
        system.debug('@@@@@@@@@@@actobbj'+actobbj);
         List<Fulfillment__c> ffobbj =[select id,Name,ActivityType__c from Fulfillment__c where ActivityType__c=:actobbj.Id];
        return ffobbj;
    }
    @AuraEnabled
    public static  List<Fulfillment__c> getfullfillment(string acctid){
        List<Fulfillment__c> actobbj =[select id,Name from Fulfillment__c where ActivityType__c=:acctid];
         system.debug('actobbj@@@@@'+actobbj);
        return actobbj;
    }
    @AuraEnabled
    public static Fulfillment__c createfull(string name,string contact,string Activity){
        Fulfillment__c ff =new Fulfillment__c();
        ff.Name =name;
        //ff.ActivityType__c =;
        ff.Explorer__c =contact;
        insert ff;
        return ff;
    }
}