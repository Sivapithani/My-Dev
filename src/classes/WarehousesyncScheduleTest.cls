@isTest
public class WarehousesyncScheduleTest {
    static testmethod void  testschedule() {
        
        Test.StartTest();
        WarehouseSyncSchedule sh1 = new WarehouseSyncSchedule();      
        String sch = '0 0 1 * * ?';
        system.schedule('Test check', sch, sh1);
        Test.stopTest();
        
    }
}