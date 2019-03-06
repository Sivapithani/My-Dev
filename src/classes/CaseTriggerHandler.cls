public class CaseTriggerHandler{

    public static Final String TWENTY_FOUR_SEVEN = '24x7';
    public static Final String EIGHT_FIVE = '8x5';
    public static Final String EIGHT_FIVE_SEVEN = '8x5x7';
    public static Final String EIGHT_FIVE_FIVE = '8x5x5';
   
    
    public CaseTriggerHandler(){
        
    }
    public static void onBeforeInsert(){
        getCoverageCode(trigger.new);
    }
    public static void onBeforeUpdate(){
        getCoverageCode(trigger.new);
    }
    
    public static void getCoverageCode(List<Case> newCaseList){
        List<Case> coverageCodeTwentyFourSeven = new List<Case>();
        List<Case> coverageCodeEightFiveSeven = new List<Case>();
        List<Case> coverageCodeEightFive = new List<Case>();
        List<Case> coverageCodeEightFiveFive = new List<Case>();
        
        Set<Id> caseidSet = new Set<Id>();
        for(Case caseobject : newCaseList){
            caseidSet.add(caseobject.Id);
        }
        List<Case> InsertCaseList = [SELECT Id, Entitlement__r.Coverage_Code__c, Non_SLA__c, 
                                    Requested_Date_Time__c
                                    FROM Case 
                                    WHERE Id IN: caseidSet];
        
        for(Case cobj : InsertCaseList){
            System.debug('cobj.Entitlement.Coverage_Code__c#####' + cobj.Entitlement__r.Coverage_Code__c );
            if( cobj.Entitlement__r.Coverage_Code__c !=null){
            if( cobj.Entitlement__r.Coverage_Code__c.equalsignorecase(TWENTY_FOUR_SEVEN) ){
            //if( cobj.Entitlement.Coverage_Code__c == TWENTY_FOUR_SEVEN ){
                coverageCodeTwentyFourSeven.add(cobj);
            }else if(cobj.Entitlement__r.Coverage_Code__c.equalsignorecase(EIGHT_FIVE) && !cobj.Non_SLA__c  ){
            //}else if(cobj.Entitlement.Coverage_Code__c == EIGHT_FIVE && !cobj.Non_SLA__c ){
                coverageCodeEightFive.add(cobj);
               
            }else if( cobj.Entitlement__r.Coverage_Code__c.equalsignorecase(EIGHT_FIVE_SEVEN) && !cobj.Non_SLA__c  ){
            //}else if( cobj.Entitlement.Coverage_Code__c == EIGHT_FIVE_SEVEN && !cobj.Non_SLA__c){
                 coverageCodeEightFiveSeven.add(cobj);
            }else if( cobj.Entitlement__r.Coverage_Code__c.equalsignorecase(EIGHT_FIVE_FIVE) && !cobj.Non_SLA__c   ){
            //}else if( cobj.Entitlement.Coverage_Code__c == EIGHT_FIVE_FIVE && !cobj.Non_SLA__c){
                coverageCodeEightFiveFive.add(cobj);
            }  
            }
        }
        
        if(!coverageCodeTwentyFourSeven.isEmpty()){
            CaseTriggerHelper.coverageCodeTwentyFourSeven(coverageCodeTwentyFourSeven);
        }
        if(!coverageCodeEightFiveSeven.isEmpty()){
            CaseTriggerHelper.coverageCodeEightFiveSeven(coverageCodeEightFiveSeven);
        }
        if(!coverageCodeEightFive.isEmpty()){
            CaseTriggerHelper.coverageCodeEightFive(coverageCodeEightFive);
        }
        if(!coverageCodeEightFiveFive.isEmpty()){
            CaseTriggerHelper.coverageCodeEightFiveFive(coverageCodeEightFiveFive);
        }
        
    }
}