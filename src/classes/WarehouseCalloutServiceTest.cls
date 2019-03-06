@isTest
private class WarehouseCalloutServiceTest {
    static testmethod void WarehouseEquipmemtSync(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
         System.assertEquals(1, [SELECT count() FROM Product2]);
    }
}