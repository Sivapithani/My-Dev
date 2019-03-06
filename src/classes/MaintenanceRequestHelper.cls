public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<case> newcaseList){
       list<case> tobeUpdate =new list<case>();
        for(case cobj :newcaseList){
            case newcase =new case();
            if(cobj.Vehicle__c !=null)
                newcase.Vehicle__c =cobj.Vehicle__c;
            if(cobj.Equipment__c !=null)
                newcase.Equipment__c =cobj.Equipment__c;
            newCase.Type = 'Routine Maintenance';
            newCase.Subject = 'Routine Maintenance Auto-generated';
            newCase.Date_Reported__c = System.today();
             Integer shortSpan = 0;
            if(cobj.Work_parts__r.size()>0){
                for(Work_part__c wp:cobj.Work_parts__r){
                	  if(wp.Equipment__r.Maintenance_Cycle__c != NULL && (wp.Equipment__r.Maintenance_Cycle__c < shortSpan || shortSpan == 0 )){
                        shortSpan = Integer.ValueOf(wp.Equipment__r.Maintenance_Cycle__c);
                          system.debug('#########################shortSpan'+shortSpan);
                    }    
                }
            }else if(cobj.Equipment__r.Maintenance_Cycle__c != NULL){
                	shortSpan = Integer.ValueOf(cobj.Equipment__r.Maintenance_Cycle__c);
                 system.debug('#########################shortSpanelse'+shortSpan);
            }
            newCase.Date_Due__c =system.today().addDays(shortSpan);
            system.debug('#########################newCase'+newCase);
            tobeUpdate.add(newCase);
        }
        if(tobeUpdate != null && tobeUpdate.size()>0){
            system.debug('#########################tobeUpdate'+tobeUpdate);
            insert tobeUpdate;
        }
    }        
    
}