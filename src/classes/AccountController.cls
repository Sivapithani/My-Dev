public class AccountController 
{
    public static void AccountInsert()
    {
        try
        {
            Account accobj = new Account();
            accobj.Name ='Test Apex Code' ;
            insert accobj;  
        }
        catch (Exception ex)
        {
            system.debug('Error Message'+ex.getMessage()) ;
        }
        
    }
    public static void Accountupdate(string accid)
    {
        try
        {
            Account accobj = new Account();
            accobj.Id =accid;
            accobj.Name ='Test' ;
            accobj.AccountSource ='Other';
           accobj.Business_Hours__c = '10';
            update accobj;  
        }
        catch (Exception ex)
        {
            system.debug('Error Message'+ex.getMessage()) ;
        }
        
    }
    public static void Accountdelete(string accid)
    {
        Account acc =[Select Id from Account where Id=:accid];
        try
        {
            if(acc != null)
            delete acc;
        }
        catch (Exception ex)
        {
            system.debug('Error Message'+ex.getMessage()) ;
        }
       
    }
}