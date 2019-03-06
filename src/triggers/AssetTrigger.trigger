trigger AssetTrigger on Asset (after insert, after update) {
    
    if(Trigger.isafter) {
        if(Trigger.Isinsert && ! AssetTriggerHandler.isAftreCallFire){
             //AssetTriggerHandler.handleAftrinsert(trigger.new);
        }
         if(Trigger.Isupdate && ! AssetTriggerHandler.isAftreCallFire){
          // AssetTriggerHandler.handleAftrUpdate(trigger.new);
        }
           
    }

}