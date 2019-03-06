@isTest
public class aok_cs_CLGenericController_Test {

    static testmethod void testlookup(){
        list<Account> AccList =new list<Account>();
        Account acc = new Account();
        acc.Name='Test Account1';
        AccList.add(acc); 
         Account acc1 = new Account();
        acc1.Name='Test Account2';
        AccList.add(acc1); 
         Account acc2 = new Account();
        acc2.Name='Test Account1';
        AccList.add(acc2); 
        Account acc3 = new Account();
        acc3.Name='Test Account3';
        AccList.add(acc3); 
        insert AccList;
        
        aok_cs_CustomLookupGenericController.fetchLookUpValues('Test', 'Account', '','', 'Name');
        aok_cs_CustomLookupGenericController.fetchLookUpValues('', 'Account', '','', 'Name');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'Account', 'noRecordType','', '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'Account', '','', '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('Test', 'Account', '','', '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('Test', 'Account', '','', '','','','','','No');
      	aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('Test', 'Account', 'noRecordType','', '','','','','','yes');
      	aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('Test', 'Account', 'noRecordType','', '','','','','','');
      
        contact conobj =new contact();
        conobj.LastName ='Test Contact';
        conobj.AccountId =acc.id;
        insert conobj;
         aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'contact', '',acc.id, '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'contact', 'noRecordType',acc.id, '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'contact', 'noRecordType',acc.id, '','','','','','');
        aok_Household__c house =new aok_Household__c();  
        house.Name__c ='Test HouseHould';
        insert house;
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'aok_Household__c', 'noRecordType',acc.id, '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'aok_Household__c', 'noRecordType',acc.id, '','','','','','');
        
        aok_Client__c client =new aok_Client__c();
        client.Current_Household__c =house.id;
        //client. ='Test HouseHould';
        insert client;
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'aok_Client__c', 'noRecordType',house.id, '','','','','','yes');
        aok_cs_CustomLookupGenericController.fetchcaseLookUpValues('', 'aok_Client__c', 'noRecordType',house.id, '','','','','','');
       
    }
    }