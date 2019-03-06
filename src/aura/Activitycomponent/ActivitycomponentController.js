({
	Navigatetocontact : function(component, event, helper) {
       var sObjectEvent = $A.get("e.force:navigateToSObject");
        alert('Hi'+component.get("v.conid"));
        sObjectEvent.setParams({
            "recordId": component.get("v.conid"),
            "slideDevName": 'detail'
        })
        sObjectEvent.fire(); 
	}
})