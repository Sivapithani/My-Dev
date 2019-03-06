({
	handleClick : function(component, event, helper) {
        //alert('Hi');
        var saveAction = component.get("c.refreshstring");
        saveAction.setParams({'recordId':component.get("v.recordId"),
                            'stage':component.get("v.stage") });
        //event.preventDefault();
        saveAction.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
             component.set("v.status",a.getReturnValue());
            }else if (res.getState() === "ERROR") {
                console.log("Errore Saving Contact ");
            } 
        });
        
        $A.enqueueAction(saveAction);
    }
})