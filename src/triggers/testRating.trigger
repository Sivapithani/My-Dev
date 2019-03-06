trigger testRating on Contact (after insert , after update) {
    List<Account>UpdateList =new  List<Account>() ;
    Map<id,List<Contact>> mapParentIDAndChild = new Map<id,List<Contact>>();
    set<id>Parentid =new set<id>();
    boolean ishot ;
    boolean iswarm;
    if(Trigger.isafter){
        if(trigger.isupdate||trigger.isinsert){
           
            for(contact cobj:trigger.new){
                Parentid.add(cobj.Accountid); 
                system.debug('<<<<<Parentid'+Parentid);
            }
        list<contact> ContactList =[Select id,Name,Rating__c,Accountid  from Contact where Accountid IN:Parentid];
        system.debug('ContactList'+ContactList);
         for(contact objcontact :ContactList ){
            system.debug('<<<<<<objcontact '+objcontact );
            if(mapParentIDAndChild.containsKey(objcontact.Accountid)) {
                system.debug('<<<<<<in if 1st ');
                mapParentIDAndChild.get(objcontact.Accountid).add(objcontact);
                system.debug('<<<<<<in if 1st mapParentIDAndChild '+mapParentIDAndChild);
            } else {
                system.debug('<<<<<<in else 1st ');
                mapParentIDAndChild.put(objcontact.Accountid,new List<contact>{objcontact});
                system.debug('<<<<<<in else 1st mapParentIDAndChild '+mapParentIDAndChild);
            }
        }  
            for(id objId:mapParentIDAndChild.keySet()){
                system.debug('id@@'+objId);
                ishot =false;
                iswarm=false;
                for (contact childobj:mapParentIDAndChild.get(objId) ) {
                    system.debug('childobj@@'+childobj);
                    if(childobj.Rating__c =='Hot')
                        ishot =true;
                    if(childobj.Rating__c =='Warm')
                        iswarm =true;
                }
                if(ishot){
                    system.debug('id@@'+objId);
                 UpdateList.add(new Account(id=objId,Rating ='Hot'));
                   //system.debug('UpdateList@@'+UpdateList); 
                }
                else if(iswarm ==true && ishot==false){
                      UpdateList.add(new Account(id=objId,Rating ='Warm'));
                }else{
                    UpdateList.add(new Account(id=objId,Rating =''));
                }
            }
            if(!updateList.isEmpty()) {
            update updateList;
        }
       }      
    }

}