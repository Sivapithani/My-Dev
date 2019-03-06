public with sharing class NewContactController {
    public string recordTypeId;
     public NewContactController(ApexPages.StandardController std) {
       recordTypeId =  ApexPages.currentPage().getParameters().get('RecordType');
         system.debug('recordTypeId@@@@'+recordTypeId);
         NewContact();
     }
    public pageReference NewContact()
    {
        Id devRecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Flow').getRecordTypeId();
        Id GIFRecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('GIF').getRecordTypeId();
        system.debug('devRecordTypeId@@@@'+devRecordTypeId);
        if(String.ValueOf(devRecordTypeId).subString(0,15) == recordTypeId){
         return new PageReference ('/003/e?RecordType='+devRecordTypeId);
        }
        else {
            system.debug('In else');
           String gifurl = '/apex/DetailPage?retURL=%2F003%2Fo&RecordType='+GIFRecordTypeId+'&ent=Contact&save_new=1&sfdc.override=1';
        	 system.debug('gifurl = '+gifurl);
            return new PageReference (gifurl);
        }
    }
}