public class Listviewcontroller {
    
    @AuraEnabled 
    public static List<ListView> getlistview(){
      List<ListView> listviewofaccount =[SELECT Id,DeveloperName,name FROM ListView WHERE SObjectType = 'Account' ORDER BY name asc];
        if(listviewofaccount.size()>0)
            return listviewofaccount;
        else 
            return null;
    }
     @AuraEnabled
 public static List<Account> recentlyviewrecords()
    {
     List<Account>	acc=[SELECT Id, Name,Type,LastViewedDate FROM account WHERE LastViewedDate !=null ORDER BY LastViewedDate DESC limit 5];
     if(acc.size()>0)
            return acc;
        else 
            return null;
    }

}