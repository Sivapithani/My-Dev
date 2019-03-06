public class CaseTriggerHelper{

    public static void coverageCodeTwentyFourSeven(List<Case> newCaseList){
        System.debug('coverageCodeTwentyFourSeven@@@@');
        Set<Id> caseIdSet = new Set<Id>();
        for(Case cobj : newCaseList ){
            caseIdSet.add(cobj.Id);
        }
        //FUTURE METHOD CALLED
        updateCaseRecord(caseIdSet);        
    }
    public static void coverageCodeEightFiveSeven(List<Case> newCaseList){
        Set<Id> caseIdSet = new Set<Id>();
        for(Case cobj : newCaseList ){
            caseIdSet.add(cobj.Id);
        }
        //FUTURE METHOD CALLED
        updateCaseRecordForEightFiveSeven(caseIdSet); 
    
    }
    public static void coverageCodeEightFive(List<Case> newCaseList){
    Set<Id> caseIdSet = new Set<Id>();
        for(Case cobj : newCaseList ){
            caseIdSet.add(cobj.Id);
        }
        //FUTURE METHOD CALLED
        updateCaseRecordForEightFive(caseIdSet); 
    
    }
    public static void coverageCodeEightFiveFive(List<Case> newCaseList){
    
    }
    
    @future
    public static void updateCaseRecord(Set<id> caseId){
        List<Case> InsertCaseList = [SELECT Id, Entitlement__r.Coverage_Code__c, Non_SLA__c, 
                                    Requested_Date_Time__c
                                    FROM Case 
                                    WHERE Id IN: caseId];
                                    
        for(Case caseobj : InsertCaseList ){
        
            Datetime rqDateTime = System.now().addMinutes(-15);
            System.debug( 'rqDateTime.minute()@@@' +  rqDateTime.minute() );
            //rqDateTime.addHours(Integer.valueOf(caseobj.Entitlement.Response_Code__c) );
            Datetime myDate;
            if( rqDateTime.minute() >= 15 && rqDateTime.minute() <= 45){
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 30, 00);

            }else{
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 00, 00);
            }
            System.debug('myDate@@@'+ myDate );
            System.debug('myDate addHours@@@'+ myDate.addHours( 4 ) );
            caseobj.Requested_Date_Time__c = myDate.addHours( 4 );                    
        }
         System.debug('InsertCaseList@@@'+ InsertCaseList );
        update InsertCaseList;
    }
    @future
    public static void updateCaseRecordForEightFiveSeven(Set<id> caseId){
        List<Case> InsertCaseList = [SELECT Id, Entitlement__r.Coverage_Code__c, Non_SLA__c, 
                                    Requested_Date_Time__c
                                    FROM Case 
                                    WHERE Id IN: caseId];
                                    
        for(Case caseobj : InsertCaseList ){
        
            Datetime rqDateTime = System.now().addMinutes(-15);
            System.debug( 'rqDateTime.minute()@@@' +  rqDateTime.minute() );
            //rqDateTime.addHours(Integer.valueOf(caseobj.Entitlement.Response_Code__c) );
            Datetime myDate;
            if( rqDateTime.minute() >= 15 && rqDateTime.minute() <= 45){
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 30, 00);

            }else{
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 00, 00);
            }
           
            System.debug('myDate@@@'+ myDate+'hour@@'+myDate.Hour() );
            
               if(myDate.hour()>=8 && myDate.Hour()<= 17)
			   { system.debug('@@@@Addhrsinside ');
				caseobj.Requested_Date_Time__c = myDate; 
			   }
			   else
			   {
                   if(myDate.Hour()<8){
                     
                      system.debug('@@@@Addhrs1');
                       caseobj.Requested_Date_Time__c = Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                   }else{
                        system.debug('@@@@Addhrs2');
                        Datetime tempDate;
                       tempDate =Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                       caseobj.Requested_Date_Time__c =tempDate.addDays(1);
                   }
			    	 
			   }
                           
        }
        update InsertCaseList;
    }
    @future
    public static void updateCaseRecordForEightFive(Set<id> caseId){
        List<Case> InsertCaseList = [SELECT Id, Entitlement__r.Coverage_Code__c, Non_SLA__c, 
                                    Requested_Date_Time__c
                                    FROM Case 
                                    WHERE Id IN: caseId];
                                    
        for(Case caseobj : InsertCaseList ){
             Datetime myDate;
             Datetime rqDateTime = System.now().addMinutes(-15);
            if( rqDateTime.minute() >= 15 && rqDateTime.minute() <= 45){
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 30, 00);

            }else{
                myDate = Datetime.newInstance(rqDateTime.year(), rqDateTime.month(), rqDateTime.Day(), rqDateTime.Hour(), 00, 00);
            }
           
            System.debug( 'rqDateTime.minute()@@@' +  rqDateTime.minute() );
            String dayName = '';
            dayName = system.now().format('EEE'); 
            if(dayName == 'Mon'||dayName == 'Tue'||dayName == 'Wed'||dayName == 'Thu'||dayName == 'Fri'){
            if(myDate.hour()>=8 && myDate.Hour()<= 17)
			   { system.debug('@@@@Addhrsinside ');
				caseobj.Requested_Date_Time__c = myDate; 
			   }
			   else
			   {
                   if(myDate.Hour()<8){
                      //integer Addhrs =calculatehours(myDate.hour());
                      system.debug('@@@@Addhrs1');
                       caseobj.Requested_Date_Time__c = Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                   }else{
                        system.debug('@@@@Addhrs2');
                        Datetime tempDate;
                       tempDate =Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                       caseobj.Requested_Date_Time__c =tempDate.addDays(1);
                   }
			    	 
			   }
            }else
            {
                if(dayName == 'Sat' )
                {
                   Datetime tempDate;
                       tempDate =Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                       caseobj.Requested_Date_Time__c =tempDate.addDays(2); 
                }else
                {
                   Datetime tempDate;
                       tempDate =Datetime.newInstance(myDate.year(), myDate.month(), myDate.Day(), 08, 00, 00);
                       caseobj.Requested_Date_Time__c =tempDate.addDays(1);  
                }
            }
        }
        update InsertCaseList;
    }
    
}