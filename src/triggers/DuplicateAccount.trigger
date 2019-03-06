trigger DuplicateAccount on Account (before insert)
{
    set<string> newNameSet = new set<string>();
    set<string> newphoneSet = new set<string>();
   
    set<string> newstreetSet = new set<string>();
    set<string> newstateSet = new set<string>();
    set<string> newcitySet = new set<string>();
    set<string> newCountrySet = new set<string>();
   set<string> newzipcodeSet = new set<string>();
    
    set<string> dbNameSet = new set<string>();
    set<string> dbphoneSet = new set<string>();
    
     set<string> dbstreetSet = new set<string>();
   set<string> dbstateSet = new set<string>();
    set<string> dbcitySet = new set<string>();
    set<string> dbCountrySet = new set<string>();
    set<string> dbzipcodeSet = new set<string>();
    
    for(Account acc : trigger.new)
    {
        if(acc.Name !=null)
        newNameSet.add(acc.Name);
        if(acc.Phone !=null)
        newphoneSet.add(acc.Phone);
         if(acc.BillingStreet !=null)
        newstreetSet.add(acc.BillingStreet);
         if(acc.BillingState !=null)
        newstateSet.add(acc.BillingState);
         if(acc.BillingCity !=null)
        newcitySet.add(acc.BillingCity);
        if(acc.BillingCountry !=null)
        newCountrySet.add(acc.BillingCountry);
         if(acc.BillingPostalcode  !=null)
        newzipcodeSet.add(acc.BillingPostalcode );
      
    }
    for(Account dbacc : [select id,Name,Phone,BillingStreet,BillingState,BillingCity,BillingCountry,BillingPostalcode 
                         from Account where (Phone IN: newphoneSet OR Name IN: newNameSet OR BillingCity IN: newcitySet
                         OR BillingStreet IN: newstreetSet OR BillingState IN: newstateSet OR BillingCountry IN: newCountrySet 
                        OR BillingPostalcode IN:newzipcodeSet)])
    {   system.debug('dbacc'+dbacc);
         if(dbacc.Name  !=null)
        	dbNameSet.add(dbacc.Name);
         if(dbacc.Phone  !=null)
        	dbphoneSet.add(dbacc.Phone);
         if(dbacc.BillingStreet !=null)
       		dbstreetSet.add(dbacc.BillingStreet); 
         if(dbacc.BillingState !=null)
       		dbstateSet.add(dbacc.BillingState);
         if(dbacc.BillingCity !=null)
       		dbcitySet.add(dbacc.BillingCity);
         if(dbacc.BillingCountry  !=null)
       		dbCountrySet.add(dbacc.BillingCountry);
         if(dbacc.BillingPostalcode  !=null)
       		dbzipcodeSet.add(dbacc.BillingPostalcode); 
    }

    for(Account newacc: trigger.new){
        if(dbNameSet.contains(newacc.Name) || dbphoneSet.Contains(newacc.Phone)
          || dbstreetSet.contains(newacc.BillingState) ||dbstateSet.contains(newacc.BillingState) ||
          dbcitySet.contains(newacc.BillingCity) || dbCountrySet.contains(newacc.BillingCountry)||
          dbzipcodeSet.contains(newacc.BillingPostalcode))
            newacc.addError('You are inserting Duplicate Account');

    }

}