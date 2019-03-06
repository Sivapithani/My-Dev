({
	goToRecord : function(component, event, helper) {
       
        var sObjectEvent =$A.get("e.force.navigateToSobject");
        sObjectEvent.setParams ({
            "recordId" :Component.get("v.contact.Id")
        });
        sObjectEvent.fire();
		
	}
})