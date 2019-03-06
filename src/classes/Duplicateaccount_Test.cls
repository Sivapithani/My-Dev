@Istest
public class Duplicateaccount_Test {
    static  Testmethod void duplicateTest(){
     	List<Account > AccList =new List<Account >(); 
       
        Account acc1 =new Account();
        	acc1.Name='Test1234';
            acc1.Phone='1234567890';
            acc1.BillingStreet='Test Street';
        	acc1.BillingState='Test State';
            acc1.BillingCity='Test City';
            acc1.BillingCountry='Test Country';
            acc1.BillingPostalcode='12345';
         insert acc1 ;
         Account acc2 =new Account();
        	acc2.Name='Test1234';
            acc2.Phone='12345678901';
            acc2.BillingStreet='Test Street';
        	acc2.BillingState='Test State';
            acc2.BillingCity='Test City';
            acc2.BillingCountry='Test Country';
            acc2.BillingPostalcode='12345';
           // AccList.add(acc2);
        
        test.startTest();
        try{
            insert acc2;
        }
       catch(DMLException e) {
            system.assert(e.getMessage().contains('You are inserting Duplicate Account'));
        
        }
        test.stopTest();
    }
   

}