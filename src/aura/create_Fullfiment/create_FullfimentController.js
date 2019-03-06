({
	createContact : function(component, event, helper) {
        var action =component.get("c.createfull");
        action.setParams({
            name:component.get("v.Name"),
            contact:component.get("v.contact"),
            Activity:component.get("v.acctivity")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state =="SUCCESS"){
                component.set("v.fullfill",response.getReturnValue()) ; 
                var sObectEvent = $A.get("e.force:navigateToSObject");
                alert('Contact Id'+ component.get("v.fullfill.Id"));
                sObectEvent .setParams({
                    "recordId": component.get("v.fullfill.Id"),
                    "slideDevName": "details"
                });
                sObectEvent.fire();
            }
        });  
        $A.enqueueAction(action);
		
	}
})