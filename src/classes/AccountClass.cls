public class AccountClass {

    public List<AccountWrappercls> wrapperList{get;set;}
    public string sortableField{get;set;}
    public string sortOrder{get;set;}
    public string previoussortfield{get;set;}
    public AccountClass(){
        wrapperList = new List<AccountWrappercls>();
        sortableField = 'name';
        sortOrder = 'asc';
        previoussortfield =sortableField;
        for(Account caseobj:[select id,name,AccountNumber ,SLAExpirationDate__c from Account where AccountNumber !=null and SLAExpirationDate__c != null  ]){
                AccountWrappercls wrapObj = new AccountWrappercls(caseobj.SLAExpirationDate__c ,caseobj.name,caseobj.AccountNumber);
                wrapperList.add(wrapObj);
        }           
        wrapperList.sort();
    }
    public pagereference doSort(){      
        //sortorder='asc';      
        if(previoussortfield == sortableField){
            sortorder='desc';
            previoussortfield=null;
        }
        else{
            sortorder='asc';            
            previoussortfield=sortableField;
        }
        System.debug('sortableField:::'+sortableField);
        System.debug('sortOrder::'+sortOrder);
        AccountWrappercls.sortableField = sortableField;
        AccountWrappercls.sortorder = sortOrder;        
        wrapperList.sort();
        return null;
    }
   
}