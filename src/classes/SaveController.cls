public class SaveController {
@AuraEnabled
public static Master__C saveRecord(Master__C mas){
    upsert mas; 
    return mas; 
}
    @AuraEnabled
   public static Master__C saveRecorddetails(string name, string firstname, string email,date tdate){
    Master__C temp =new Master__C();
    temp.Name= name; 
    temp.LastName__c= firstname; 
    temp.Email__c= email; 
      temp.Due_Date__c= tdate;   
       insert temp;
       return temp;
} 
}