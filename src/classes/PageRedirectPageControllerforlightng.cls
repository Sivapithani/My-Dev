public class PageRedirectPageControllerforlightng {
public String selectedRecordType{get;set;}
   @AuraEnabled public Id recTypeId{set;get;}
    public string hostname{get; set;}
   @AuraEnabled public RecordType recordType{get;set;}
    
    public PageRedirectPageControllerforlightng(ApexPages.StandardController controller ){
        //recTypeId= apexpages.currentpage().getparameters().get('RecordType');
        hostname =System.Url.getSalesforceBaseURL().toExternalForm();
         system.debug('****hostname*********'+hostname);
    }
   @AuraEnabled
    public static RecordType recordtypename(){
      id   recTypeId= apexpages.currentpage().getparameters().get('RecordType');
        contact conobj = new contact();
        conobj.RecordTypeId = recTypeId;
        
        system.debug('****recTypeId*********'+recTypeId);
        RecordType recordTypeobj=[select id,Name from RecordType where id=:recTypeId];
        system.debug('****recordTypeobj*********'+recordTypeobj.name);
        return recordTypeobj ;
    }
}