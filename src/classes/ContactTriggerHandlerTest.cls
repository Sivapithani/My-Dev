@isTest
public class ContactTriggerHandlerTest {

    static testmethod void validation (){
        Account acc = new  account();
        acc.Name= 'testAccount';
        acc.Maximum_License__c =2;
        acc.Type_of_Study__c ='Academic';
        insert acc;
        AccountController.AccountInsert();
        AccountController.Accountupdate(acc.Id);
         AccountController.Accountdelete(acc.Id);
        
        List<contact> conlist=new List<contact>();
        contact con =new contact();
        con.LastName='testcon';
        con.Type_of_Study__c='Academic';
        con.AccountId=acc.id;
        conlist.add(con);
        contact con2 =new contact();
        con2.LastName='testcon2';
        con2.Type_of_Study__c='Academic';
        con2.AccountId=acc.id;
        conlist.add(con2);
        insert conlist;
        Test.startTest();
        system.assertEquals( acc.Maximum_License__c, conlist.size());
        system.assertEquals( acc.Type_of_Study__c,  con.Type_of_Study__c);
        system.assertEquals( acc.Type_of_Study__c,  con2.Type_of_Study__c);
     try
       {
         con2.Type_of_Study__c='Commercial';
         update con2;    
       }
        catch(Exception ex)
        {
          system.assert(ex.getMessage().contains('Type of study should be same')) ;
        } 
        
        Test.stopTest();
  
    }
    static testmethod void ErrorMessage (){
        Account acc = new  account();
        acc.Name= 'testAccount';
        acc.Maximum_License__c =2;
        acc.Type_of_Study__c ='Academic';
        insert acc;
        List<contact> conlist=new List<contact>();
        contact con =new contact();
        con.LastName='testcon';
        con.Type_of_Study__c='Academic';
        con.AccountId=acc.id;
        conlist.add(con);
        contact con2 =new contact();
        con2.LastName='testcon2';
        con2.Type_of_Study__c='Academic';
        con2.AccountId=acc.id;
        conlist.add(con2);
        contact con3 =new contact();
        con3.LastName='testcon3';
        con3.Type_of_Study__c='Academic';
        con3.AccountId=acc.id;
        conlist.add(con3);
        insert conlist;
         system.assertNotEquals( acc.Maximum_License__c, conlist.size());
        system.assertEquals( acc.Type_of_Study__c,  con.Type_of_Study__c);
        system.assertEquals( acc.Type_of_Study__c,  con2.Type_of_Study__c);
        system.assertEquals( acc.Type_of_Study__c,  con3.Type_of_Study__c);
        Test.startTest();
        try
        {
         update con2;    
        }
        catch(Exception ex)
        {
          system.assert(ex.getMessage().contains(' Limit exceed')) ;
        }
        
        Test.stopTest();
    }
}