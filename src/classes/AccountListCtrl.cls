public class AccountListCtrl{
 @AuraEnabled
 public static List<Account> getAccounts(){     
    List<Account> accList = [Select Id, Name, AccountNumber, Rating, Industry, AnnualRevenue, NumberOfEmployees from Account 
                            where Rating !=null and Industry !=null limit 10];
    return accList;
 }
    @AuraEnabled
 public static List<contact> getContacts(){     
    List<contact> cntList = [Select Id, Name,Email,Phone from contact limit 2];
    return cntList;
 }
     @AuraEnabled
 public static List <account> fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Account > returnList = new List < Account > ();
  List < Account > lstOfAccount = [select id, Name, Type, Industry, Phone, Rating, website from account
                                   where Name LIKE: searchKey LIMIT 50];
 
  for (Account acc: lstOfAccount) {
   returnList.add(acc);
  }
  return returnList;
}
}