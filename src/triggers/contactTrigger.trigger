trigger contactTrigger on Contact (before insert ,before update) {
    if(Trigger.isbefore && Trigger.isinsert){
       // contacTriggerhelper.validatemaxLicenes(trigger.new);
    }

    if(Trigger.isbefore && Trigger.isupdate){
       /// contacTriggerhelper.validatemaxLicenes(trigger.new);
    }

}