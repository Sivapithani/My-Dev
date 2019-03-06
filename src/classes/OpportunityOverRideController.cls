public class OpportunityOverRideController {
       public static Map<Id, String> recordtypemap {get;set;}
    
   @AuraEnabled        
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = opportunity.SObjectType.getDescribe().getRecordTypeInfos();    
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
            recordtypemap.put(rt.getRecordTypeId(), rt.getName());
        } 
        system.debug('@@@######'+recordtypemap.values());
        return recordtypemap.values(); 
    }
    
   @AuraEnabled
    public static Deal__c getdefaultvalues(id dealId){
         system.debug('@@@dealId######'+dealId);
        Deal__c dealobj =[select id,name ,Account__c,Principal_Contact__c from Deal__c where id=:dealId limit 1];
        system.debug('@@@dealobj######'+dealobj);
        return dealobj;
    }
    @AuraEnabled
    public static string getrecordtypeid(string recordTypeLabel){
         system.debug('@@@recordTypeLabel######'+recordTypeLabel);
        string Id = [SELECT id from RecordType where Name =:recordTypeLabel and sObjectType='opportunity'].Id;
         system.debug('@@@Id######'+Id);
        return Id;
    }
}