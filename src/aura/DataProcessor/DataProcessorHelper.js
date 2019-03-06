({
    //Fetch the accounts from the Apex controller
    getcontacts: function(component) {
     var action = component.get("c.getContacts");
     //Set up the callback
     action.setCallback(this, function(actionResult) {
            component.set("v.contacts", actionResult.getReturnValue());
        	
      	}); 
        $A.enqueueAction(action);  
    }
})