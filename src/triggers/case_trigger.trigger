trigger case_trigger on Case (before insert, after insert, before update) {
    if(trigger.isInsert && trigger.isBefore){
    }
    if(trigger.isInsert && trigger.isAfter){
        CaseTriggerHandler.onBeforeInsert();
    }
    if(trigger.isUpdate && trigger.isBefore){
        //CaseTriggerHandler.onBeforeUpdate();
    }
}