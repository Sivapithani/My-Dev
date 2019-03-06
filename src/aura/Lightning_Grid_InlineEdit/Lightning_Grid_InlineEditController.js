({
	doInit: function(component, event, helper) {
      // call the apex class method and fetch account list  
         var action = component.get("c.fetchAccounts");
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                  component.set("v.AccountList", storeResponse);
                  console.log('Acc: '+component.get("v.AccountList"));
            }
        });
        $A.enqueueAction(action);
    }
    
})