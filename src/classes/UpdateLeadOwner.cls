global class  UpdateLeadOwner implements Database.Batchable<sObject> {
    
   global Database.QueryLocator start(Database.BatchableContext bc){
        String Query='Select id,LeadSource from Lead where CreatedDate  =:today limit 30000 ';
    return Database.getQueryLocator(Query);
    }  
   global void execute(Database.BatchableContext bc, List<Lead> scope){
      Group queue = [SELECT Id FROM Group WHERE Name = 'WebTeam' and Type='Queue'];
	 user loginuser =[select id,name from user where Name='siva Pithani'limit 1];
       list<Lead>leadList =new list<Lead>();
        for(Lead l: scope){
            if(l.LeadSource== 'Email'){
                l.ownerId =loginuser.Id;
            }
            if(l.LeadSource== 'Web'){
                 l.ownerId =queue.id;
            } 
            leadList.add(l);
         }
       update leadList;
   }
       global void finish(Database.BatchableContext bc){
        
    }
}