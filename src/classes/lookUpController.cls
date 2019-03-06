public class lookUpController {
   @AuraEnabled
 public static List < account > fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Account > returnList = new List < Account > ();
     List < Account > lstOfAccount =new List < Account > ();
  if(searchKeyWord.length()>0)
  lstOfAccount = [select id, Name from account where Name LIKE: searchKey];
 else
  lstOfAccount = [select id, Name from account limit 15]; 
  for (Account acc: lstOfAccount) {
     returnList.add(acc);
     }
  return returnList;
 }
}