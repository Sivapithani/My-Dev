public class customLookUpController {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 15';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        system.debug('returnList@@'+returnList);
        return returnList;
    }
     @AuraEnabled
    public static string getAccountName(string recordid){
        system.debug('acIde@@'+recordid);
        Account acc=[select id,Name from Account where id=:recordid];
          system.debug('acc.Name@@'+acc.Name);
        return acc.Name;
    }
}