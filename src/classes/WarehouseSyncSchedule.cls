global class WarehouseSyncSchedule implements schedulable {
  // implement scheduled code here
    global void execute(SchedulableContext sc){
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}
/* WarehouseSyncSchedule m = new WarehouseSyncSchedule();
String sch = '00 00 1 * * ?';
String jobID = system.schedule('WarehouseEquipmentSync  Job', sch, m);*/