trigger MaintenanceRequest on Case (before update, after update) {
    
    list<case> caseList =[select id,Vehicle__c,Equipment__c,Equipment__r.Maintenance_Cycle__c ,Date_Due__c,Date_Reported__c,Subject,Status,
                          Origin,Reason,AccountId,ContactId,AssetId,(select id,name,Equipment__r.Maintenance_Cycle__c 
                           from Work_Parts__r ) from case 
                          where id IN:Trigger.newmap.keyset() And status ='closed' And 
                          (type='Repair' OR type ='Routine Maintenance')];
    if(caseList !=null && caseList.size()> 0){}
     MaintenanceRequestHelper.updateWorkOrders(caseList);  
}