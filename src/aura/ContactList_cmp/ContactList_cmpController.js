({
    myAction : function(component, event, helper) {
        var action =component.get("c.getAllContacats");
        console.log('The action value is: '+action);
        action.setCallback(this, function(a){ 
            
            component.set("v.contact", a.getReturnValue());
            //  console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
            //console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
            
        });
        $A.enqueueAction(action);
    },
    Navigate2comp:function(component, event, helper) {
         var currentRecordId = event.target.id;
        var myEvent = $A.get("e.c:ContactNavigationEvent");
	    myEvent.setParams({"data":currentRecordId});
	    myEvent.fire();
        var evt = $A.get("e.force:navigateToComponent");
          console.log('===evt===:'+evt);
          console.log('event.target.id## :'+event.target.id);
           console.log('Accountid## :'+component.get("v.recordId"));
        //c:Activitycomponent
   
     /* evt.setParams({
            componentDef : "c:Contact_Dteail_cmp",
            componentAttributes: {    
                contactid :currentRecordId,
                Accountid:component.get("v.recordId")
            } */
           evt.setParams({
            componentDef : "c:Activity_Responsive",
            componentAttributes: {    }
        });
        
         console.log('===After SetParams=====');
        evt.fire();
     }
    
})