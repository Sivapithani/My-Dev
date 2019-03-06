({
    //Fetch the accounts from the Apex controller
    getcontacts: function(component) {
     var action = component.get("c.getContacts");
     //Set up the callback
     action.setCallback(this, function(actionResult) {
            component.set("v.contacts", actionResult.getReturnValue());
        	//component.set("v.accountsLength", actionResult.getReturnValue().length); 
      	}); 
        $A.enqueueAction(action);  
    }
})