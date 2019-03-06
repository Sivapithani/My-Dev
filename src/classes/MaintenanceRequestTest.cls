@isTest
public class MaintenanceRequestTest {
    static testmethod void testcase(){
        Account acc = new  account();
        acc.Name= 'testAccount';
        acc.Maximum_License__c =2;
        acc.Type_of_Study__c ='Academic';
        insert acc;
        
        contact con =new contact();
        con.LastName='testcon';
        con.Type_of_Study__c='Academic';
        con.AccountId=acc.id;
        insert con;
        product2 pro = new product2();
        pro.Name='demo product';
        pro.Maintenance_Cycle__c=5;
        insert pro;
        
        Vehicle__c vobj =new Vehicle__c();
        vobj.Name ='Demo1';
        insert vobj;
        
        case cobj =new case();
        cobj.Type = 'Other';
        cobj.Status = 'closed';
        cobj.Origin = 'other';
        cobj.AccountId = acc.id;
        cobj.ContactId = con.id;
        cobj.Equipment__c = pro.id;
        cobj.Vehicle__c= vobj.id;
        insert cobj;
        Work_Part__c  wr = new Work_Part__c();
        wr.Maintenance_Request__c = cobj.id;
        wr.Equipment__c = pro.Id;
        insert wr;
        test.startTest();
        cobj.Type = 'Repair';
        update cobj;
        test.stopTest();
    }
    static testmethod void testcase1(){
        product2 pro = new product2();
        pro.Name='demo product';
        pro.Maintenance_Cycle__c=5;
        insert pro;
        
        Vehicle__c vobj =new Vehicle__c();
        vobj.Name ='Demo1';
        insert vobj;
        
        case cobj =new case();
        cobj.Type = 'Other';
        cobj.Status = 'closed';
        cobj.Origin = 'other';
        cobj.Equipment__c = pro.id;
        cobj.Vehicle__c= vobj.id;
        insert cobj;
        test.startTest();
        cobj.Type = 'Repair';
        update cobj;
        test.stopTest();
    }
}