public with sharing class inlineEditCtrl {
  
    // method for fetch account records list  
    @AuraEnabled
    public static List < account > fetchAccounts() {
        
        List < Account > returnList = new List < Account > ();
        List < Account > lstOfAccount = [select id, Name, Type, Industry,Fax, Phone, Rating, website ,(select id,LastName,FirstName,Email from Contacts  limit 1) from account where Rating !=null and website != null    LIMIT 1];
        system.debug('lstOfAccount'+lstOfAccount);
        for (Account acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    } 
 /*   @AuraEnabled
 public static List < account > fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Account > returnList = new List < Account > ();
  List < Account > lstOfAccount = [select id, Name, Type, Industry, Phone, Rating, website from account
                                   where Name LIKE: searchKey LIMIT 50];
 
  for (Account acc: lstOfAccount) {
   returnList.add(acc);
  }
  return returnList;
 }  */
   
  @AuraEnabled
    public static  contact savecon( contact con) {
       
        update con;
        system.debug('con'+con);
        return con;
    }
  // method for update records after inline editing  
    @AuraEnabled
    public static  account updateAccount(string accid) {
        system.debug('accid'+accid);
        account acc =new account();
        acc.id=accid;
        update acc;
        return acc;
    }
     // method for update records after inline editing  
    @AuraEnabled
    public static  List<account> saveAccount( List<account> lstAccount) {
        update lstAccount;
        return lstAccount;
    }
    
  // method for fetch picklist values dynamic  
    @AuraEnabled
    public static List < String > getselectOptions(sObject objObject, string fld) {
        system.debug('objObject --->' + objObject);
        system.debug('fld --->' + fld);
        List < String > allOpts = new list < String > ();
        // Get the object type of the SObject.
        Schema.sObjectType objType = objObject.getSObjectType();
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
     @AuraEnabled
    public static List < String > deleteRecords(List < String > lstRecordId) {
        // for store Error Messages  
        List < String > oErrorMsg = new List < String > ();
        // Query Records for delete where id in lstRecordId [which is pass from client side controller] 
        List < Account > lstDeleteRec = [select Id from Account where id IN: lstRecordId];
        
        // delte contact list with Database.DeleteResult[] database class.
        // It deletes some queried contacts using <samp class="codeph apex_code">Database.<span class="statement">delete</span></samp> 
        // with a false second parameter to allow partial processing of records on failure.
        // Next, it iterates through the results to determine whether the operation was successful or not
        // for each record. and check if delete contact successful so print msg on debug, 
        // else add error message to oErrorMsg List and return the list  
        Database.DeleteResult[] DR_Dels = Database.delete(lstDeleteRec, false);
        // Iterate through each returned result
        for (Database.DeleteResult dr: DR_Dels) {
            if (dr.isSuccess()) {
                system.debug('successful delete contact');
                // Operation was successful
            } else {
                // Operation failed, so get all errors   
                oErrorMsg.add('');
                for (Database.Error err: dr.getErrors()) {
                    // add Error message to oErrorMsg list and return the list
                    oErrorMsg.add(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }
        return oErrorMsg;
        
    }
}