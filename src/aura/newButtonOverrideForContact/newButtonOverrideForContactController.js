({
	doInit : function(component, event, helper) {
		alert('HI');
        var action = component.get("c.recordtypename");
        action.setCallback(this, function(a){
            component.set("v.recordTypeobj", a.getReturnValue());
        });
        var rType =component.get("v.recordTypeobj.Name");
        alert('selected Rtype'+rType);
        
        var createContactEvent = $A.get("e.force:createRecord");
            createContactEvent.setParams({
                "entityApiName": "Contact",
                "recordTypeId": "0120I0000019aB4QAI"
            });
        createContactEvent.fire();
       /*  var homeEvt = $A.get("e.force:navigateToObjectHome");
            homeEvt.setParams({
                "scope": "Contact"
            });
			homeEvt.fire();  */
        $A.enqueueAction(action);
	}
})