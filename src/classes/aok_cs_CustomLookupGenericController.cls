public class aok_cs_CustomLookupGenericController {
@AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, String recordTypeName,String SiteLocationId, String searchedFieldName) {
        system.debug('ObjectName-->' + ObjectName);
        //static String siteLocIdStr {get;set;}
          String searchKey = '%' +searchKeyWord + '%';
        String recordTypeVar = recordTypeName;
        String ObjectNameVar = ObjectName;
        system.debug('recordTypeVar +++'+recordTypeVar);
        String siteLocationIdVar = SiteLocationId;
        String siteLocIdStr;
        String sQuery;
       
        system.debug('siteLocation Id +++'+siteLocationIdVar);          
        
        List < sObject > returnList = new List < sObject > ();
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5
        if(searchKeyWord  == ''){
            sQuery =  'select id,createdBy.Name, lastmodifiedBy.Name,'+searchedFieldName+' from ' +ObjectName +' order by createdDate DESC '; 
        }else{
            sQuery =  'select id,'+searchedFieldName+' from ' +ObjectName +' where '+searchedFieldName+' LIKE: searchKey order by createdDate DESC limit 5'; 
        }


      
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    
            
    @AuraEnabled
    public static List < sObject > fetchcaseLookUpValues(String searchKeyWord, String ObjectName, String recordTypeName,String SiteLocationId, String notInUseRecType,String accobjId,String parentAccId,String casetypeparam,String searchedFieldName,String fromlookup) {
        system.debug('ObjectName-->' + ObjectName);
        //static String siteLocIdStr {get;set;}
        String searchKey = '%' +searchKeyWord + '%';
        String recordTypeVar = recordTypeName;
        String ObjectNameVar = ObjectName;
        system.debug('recordTypeVar +++'+recordTypeVar);
        String siteLocationIdVar = SiteLocationId;
        String siteLocIdStr;
        String sQuery; 
        String notInUseRecTypevar = notInUseRecType;
        String accid = accobjId ; //'001a000001jnkwHAAQ';
        String parentAccountId = parentAccId ;
        String casetype = casetypeparam ;
        
        system.debug('siteLocation Id +++'+siteLocationIdVar);
        system.debug('searchKeyWord+++'+searchKeyWord);
        system.debug('recordTypeVar +++'+ recordTypeVar);
        system.debug('ObjectName +++'+ ObjectName);
        system.debug('notInUseRecTypevar Id +++'+notInUseRecTypevar);
        system.debug('accid +++'+accobjId);
        system.debug('parentAccountId +++'+parentAccountId);
        
        List < sObject > returnList = new List < sObject > ();
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 
        if(recordTypeVar=='noRecordType'){   
            if(ObjectName != null && ObjectName.equalsIgnoreCase('Contact') && siteLocationIdVar != null  && siteLocationIdVar != ''){
                // SITE CONTACT
                System.debug('Site_Contact====>' + siteLocationIdVar );
                if( fromlookup == 'yes'){
                    //ALL SITE CONTACT LOOKUP
                    if(searchKeyWord  == null ){
                        sQuery =  'select id, Name,Phone,Email,MailingCity from ' +ObjectName + ' where AccountId =: siteLocationIdVar order by createdDate DESC';
                    }else{                        
                        sQuery =  'select id, Name,Phone,Email,MailingCity from ' +ObjectName + ' where AccountId =: siteLocationIdVar AND (Name LIKE: searchKey OR Mailingstate LIKE: searchKey OR Mailingcity LIKE: searchKey OR Mailingstreet LIKE: searchKey OR Mailingpostalcode LIKE: searchKey)  order by createdDate DESC limit 5';
                    }
                    
                }else{
                    sQuery =  'select id, Name,Phone,Email,MailingCity from ' +ObjectName + ' where AccountId =: siteLocationIdVar AND (Name LIKE: searchKey OR Mailingstate LIKE: searchKey OR Mailingcity LIKE: searchKey OR Mailingstreet LIKE: searchKey OR Mailingpostalcode LIKE: searchKey)  order by createdDate DESC limit 5';
                }                
            }else if(ObjectName != null && ObjectName.equalsIgnoreCase('Account') ){ 
                //ORGANIZATION LOOKUP
                System.debug( 'ORGANIZATION===>' + searchKeyWord );
                if(fromlookup == 'yes'){
                    if(searchKeyWord == null){
                        sQuery =  'select id, Name from ' +ObjectName + ' order by createdDate DESC limit 10000';
                    }else{
                        sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 10000';
                    }                    
                }else{
                    sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
                }
                    
            }else if(ObjectName != null && ObjectName.equalsIgnoreCase('aok_Household__c')){
                 System.debug( 'fromlookup===>' + fromlookup+'searchKeyWord@@'+ searchKeyWord);
                if( fromlookup == 'yes' ){
                    if(searchKeyWord == null){
                        sQuery =  'select id,Name__c, Name from ' +ObjectName + ' order by createdDate DESC limit 10000';
                    }else{
              			sQuery =  'select id,Name__c, Name from ' +ObjectName + ' where Name LIKE: searchKey  OR Name__c LIKE:searchKey order by createdDate DESC limit 10000';          
                    }
                    
                }else{
                    sQuery =  'select id,Name__c, Name from ' +ObjectName + ' where Name LIKE: searchKey  OR Name__c LIKE:searchKey order by createdDate DESC limit 5';
                }
            } else if(ObjectName != null && ObjectName.equalsIgnoreCase('aok_Client__c') && siteLocationIdVar != null  && siteLocationIdVar != ''){
                if( fromlookup == 'yes' ){
                    if(searchKeyWord == null){
                        sQuery =  'select id, Name,Current_Household_Name__c from ' +ObjectName + ' where Current_Household__c =: siteLocationIdVar  order by createdDate DESC limit 10000';
                    }else{
              			sQuery =  'select id, Name,Current_Household_Name__c from ' +ObjectName + ' where Current_Household__c =: siteLocationIdVar order by createdDate DESC limit 10000';          
                    }
                    system.debug('Squery ---'+sQuery); 
                }else{
                    sQuery =  'select id, Name,Current_Household_Name__c from ' +ObjectName + '  where Current_Household__c =: siteLocationIdVar order by createdDate DESC limit 5';
                    system.debug('Squery ---'+sQuery); 
                }        
            }
        }
        else{
            if(ObjectName != null && ObjectName.equalsIgnoreCase('Contact') && siteLocationIdVar != null && siteLocationIdVar != ''){
                
                sQuery =  'select id, Name from ' +ObjectName + ' where AccountId =: siteLocationIdVar  AND Name LIKE: searchKey and recordtype.developername =:recordTypeVar order by createdDate DESC limit 5';
            }else if(ObjectName != null && ObjectName.equalsIgnoreCase('Account') && fromlookup == 'yes' ){ 
            
                System.debug('All Site Location===>' + searchKeyWord );
                //ALL SITE LOCATION LOOKUP
                
                if(searchKeyWord != null && searchKeyWord != ''  ){
                    sQuery =  'select id, Name,Shippingstreet, shippingcity, shippingstate,shippingpostalcode from ' +ObjectName + ' where recordtype.developername =:recordTypeVar and ParentId=:parentAccountId and (Name LIKE: searchKey ';
               		sQuery = sQuery + 'OR shippingstate LIKE: searchKey OR shippingcity LIKE: searchKey OR shippingpostalcode LIKE: searchKey OR Shippingstreet LIKE: searchKey)order by createdDate DESC limit 5';
              
                }else{
                    sQuery =  'select id, Name,Shippingstreet, shippingcity, shippingstate,shippingpostalcode  from ' +ObjectName + ' where recordtype.developername =:recordTypeVar and ParentId=:parentAccountId order by createdDate'; 
                }
                
            }else if(ObjectName != null && ObjectName.equalsIgnoreCase('Account') && fromlookup == 'No' && parentAccountId != null){
                System.debug('only Site Location limit 5');
                // SITE LOCATION
               sQuery =  'select id, Name,Shippingstreet, shippingcity, shippingstate,shippingpostalcode from ' +ObjectName + ' where recordtype.developername =:recordTypeVar and ParentId=:parentAccountId and (Name LIKE: searchKey ';
               sQuery = sQuery + 'OR shippingstate LIKE: searchKey OR shippingcity LIKE: searchKey OR shippingpostalcode LIKE: searchKey OR Shippingstreet LIKE: searchKey)order by createdDate DESC limit 5';
              
              
            } 
            system.debug('Squery +++'+sQuery);
        }      

        
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}