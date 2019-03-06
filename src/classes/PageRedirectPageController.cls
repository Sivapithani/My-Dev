/**
PageRedirectNewPageController this class is the controller for PageRedirectPage to check the record type.

**/

public class PageRedirectPageController {
    public String selectedRecordType{get;set;}
   @AuraEnabled public Id recTypeId{set;get;}
    public string hostname{get; set;}
   @AuraEnabled public RecordType recordType{get;set;}
    
    public PageRedirectPageController(ApexPages.StandardController controller ){
        //recTypeId= apexpages.currentpage().getparameters().get('RecordType');
        hostname =System.Url.getSalesforceBaseURL().toExternalForm();
         system.debug('****hostname*********'+hostname);
  
        recTypeId= apexpages.currentpage().getparameters().get('RecordType');
        contact conobj = new contact();
        conobj.RecordTypeId = recTypeId;
        
      
        recordType=[select id,Name from RecordType where id=:recTypeId];
        system.debug('****recordTypeobj*********'+recordType);
      
    }
}