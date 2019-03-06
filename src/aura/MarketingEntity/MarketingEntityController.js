({
	doInit : function(component, event, helper) {
         helper.callactivity(component, event, helper);
      // var accid= component.get("v.activityid");
       // if(accid !=null)
		//helper.callfullfilment(component, event, helper);
	},
    gotodetails:function(component, event, helper){
        component.set("v.isactivity",true);
         component.set("v.isview",false);
    },
    createfulli:function(component, event, helper){
        console.log(event.currentTarget.Id);
       var id=event.currentTarget.Id;
        alert(' selectedid'+id);
       
        component.set("v.isNew",true);
        component.set("v.isview",false);
         component.set("v.isactivity",false);
    },
     handleclose:function (component, event, helper) {
        var recordId = component.get('v.recordId');
        alert('recordId'+recordId);
          var  navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParam("recordId", recordId);
       
         navEvt.fire();
    },
})