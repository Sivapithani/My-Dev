trigger OrderEventTrigger on Order_Event__e (after insert) {
  List<task> tasklist = new List<task>();
    for (Order_Event__e event : Trigger.New) {
        if(event.Has_Shipped__c == true){
         	task t= new task();
            t.Priority='Medium';
            t.Subject='Follow up on shipped order ' + event.Order_Number__c; 
            t.ownerId =event.CreatedById;
            tasklist.add(t); 
        }
  } 
    if(tasklist !=null && tasklist.size()>0)
        insert tasklist;
}