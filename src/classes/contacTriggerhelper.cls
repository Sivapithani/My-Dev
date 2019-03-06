public class contacTriggerhelper {
    
    public static void validatemaxLicenes(List<contact> newcon){
        set<id> accountid= new set<id>();
        map<id,Account>accountIdMap= new map<id,Account>();
        map<id,integer>conCounterMap= new map<id,integer>();
        for(contact cid:newcon){
            accountid.add(cid.Accountid);
        }
        accountIdMap =new map<id,Account>([select id,name,Maximum_License__c,Type_of_Study__c ,(select id,Type_of_Study__c from Contacts ) from Account where id IN:accountid]);
        system.debug('accountIdMap@@'+accountIdMap);
   
        for(Account acc :accountIdMap.values()){
            system.debug('size@@'+acc.contacts.size());
            integer counter =0;
            if(acc.contacts.size()>0)
            {
                for(contact con :acc.contacts)
                {
                  if(acc.Type_of_Study__c == con.Type_of_Study__c)
                    counter++;  
                }
            }
            conCounterMap.put(acc.id,counter);
            system.debug('conCounterMap@@'+conCounterMap);
        }
        for(contact con:newcon)
        { 
            if(accountIdMap.get(con.Accountid).Maximum_License__c < conCounterMap.get(con.Accountid))
             con.addError('Limit exceed');
            system.debug('account'+accountIdMap.get(con.Accountid).Type_of_Study__c +'contact'+con.Type_of_Study__c);
            if(accountIdMap.get(con.Accountid).Type_of_Study__c != con.Type_of_Study__c)
             con.addError('Type of study should be same');
        } 
       
    } 
}