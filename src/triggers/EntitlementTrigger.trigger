trigger EntitlementTrigger on Entitlement (after insert, after update,after delete) {

     if(Trigger.isafter)
     {
        if(Trigger.Isinsert && ! AssetTriggerHandler.isAftreCallFire){
            entitlementTriggerHandler.handleAftrinsert(Trigger.new);
        }
         if(Trigger.Isupdate && ! AssetTriggerHandler.isAftreCallFire){
           entitlementTriggerHandler.handleAftrUpdate(trigger.newmap,trigger.oldmap);
        }
         if(Trigger.Isdelete && ! AssetTriggerHandler.isAftreCallFire){
           entitlementTriggerHandler.handelAfterdDelete(trigger.oldmap);
        }
           
    }
}