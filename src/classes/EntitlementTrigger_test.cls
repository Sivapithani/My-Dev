@Istest
public class EntitlementTrigger_test {
    static testmethod void insertentitleScenario(){
        Account testAcc = new Account();
        testAcc.Name ='TestAccount';
        insert testAcc;
        contact testcon = new contact();
        testcon.lastname = 'testCon';
        Asset testAsset = new Asset();
        testAsset.Name = 'Test Asset';
        testAsset.AccountId = testAcc.id;
        testAsset.ContactId = testcon.id;
        insert testAsset;
        entitlement ent = new entitlement();
        ent.Name ='Test Entitlement';
        ent.AccountId = testAcc.id;
        ent.AssetId = testAsset.id;
        ent.StartDate = system.today();
        ent.EndDate = system.today().addDays(7);
        test.startTest();
        AssetTriggerHandler.isAftreCallFire =false;
        insert ent;
        
        test.stopTest();
        Asset result = [select id,name,No_of_Entitlemens__c,Has_Entitlements__c ,(select id,name from entitlements where status ='active') from asset where id =:testAsset.id];
        system.assertEquals(result.No_of_Entitlemens__c,result.entitlements.size() );
        system.assertEquals(result.Has_Entitlements__c,true );
        
    }
     static testmethod void updateentitleScenario(){
        Account testAcc = new Account();
        testAcc.Name ='TestAccount';
        insert testAcc;
        contact testcon = new contact();
        testcon.lastname = 'testCon';
        Asset testAsset = new Asset();
        testAsset.Name = 'Test Asset';
        testAsset.AccountId = testAcc.id;
        testAsset.ContactId = testcon.id;
        insert testAsset;
         list<entitlement> entList =new list<entitlement>();
        entitlement ent = new entitlement();
        ent.Name ='Test Entitlement';
        ent.AccountId = testAcc.id;
        ent.AssetId = testAsset.id;
        ent.StartDate = system.today();
        ent.EndDate = system.today().addDays(7);
        entList.add(ent);
        entitlement ent2 = new entitlement();
        ent2.Name ='Test Entitlement';
        ent2.AccountId = testAcc.id;
        ent2.AssetId = testAsset.id;
        ent2.StartDate = system.today();
        ent2.EndDate = system.today().addDays(7);
        entList.add(ent2);
        AssetTriggerHandler.isAftreCallFire =false;
        insert entList;
        Asset result = [select id,name,No_of_Entitlemens__c,Has_Entitlements__c ,(select id,name from entitlements where status ='active') from asset where id =:testAsset.id];
        system.assertEquals(result.No_of_Entitlemens__c,result.entitlements.size());
        system.assertEquals(result.Has_Entitlements__c,true );
        test.startTest();
        AssetTriggerHandler.isAftreCallFire =false;
        ent.StartDate = system.today().addDays(2);
       update ent;
        test.stopTest();
        Asset result2 = [select id,name,No_of_Entitlemens__c,Has_Entitlements__c ,(select id,name from entitlements where status ='active') from asset where id =:testAsset.id];
        system.assertEquals(result2.No_of_Entitlemens__c,result2.entitlements.size() );
        system.assertEquals(result2.Has_Entitlements__c,true );
    }
    static testmethod void deleteentitleScenario(){
        Account testAcc = new Account();
        testAcc.Name ='TestAccount';
        insert testAcc;
        contact testcon = new contact();
        testcon.lastname = 'testCon';
        Asset testAsset = new Asset();
        testAsset.Name = 'Test Asset';
        testAsset.AccountId = testAcc.id;
        testAsset.ContactId = testcon.id;
        insert testAsset;
        
        entitlement ent = new entitlement();
        ent.Name ='Test Entitlement';
        ent.AccountId = testAcc.id;
        ent.AssetId = testAsset.id;
        ent.StartDate = system.today();
        ent.EndDate = system.today().addDays(7);
        AssetTriggerHandler.isAftreCallFire =false;
        insert ent;
        Asset result = [select id,name,No_of_Entitlemens__c,Has_Entitlements__c ,(select id,name from entitlements where status ='active') from asset where id =:testAsset.id];
        system.assertEquals(result.No_of_Entitlemens__c,result.entitlements.size() );
        system.assertEquals(result.Has_Entitlements__c,true );
        test.startTest();
        AssetTriggerHandler.isAftreCallFire =false;
        delete ent;
        test.stopTest();
        Asset result2 = [select id,name,No_of_Entitlemens__c,Has_Entitlements__c ,(select id,name from entitlements where status ='active') from asset where id =:testAsset.id];
        system.assertEquals(result2.No_of_Entitlemens__c,0);
        system.assertEquals(result2.Has_Entitlements__c,false );
    }
}