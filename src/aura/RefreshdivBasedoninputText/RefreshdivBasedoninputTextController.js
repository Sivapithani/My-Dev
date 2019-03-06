({
	 initRecords: function(component, event, helper) {
      // call the apex class method and fetch account list  
         var action = component.get("c.getAccounts");
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                  component.set("v.AccountList", storeResponse);
                  //alert('Account'+component.get("v.AccountList"));
            }
        });
        $A.enqueueAction(action);
	},
     Search: function(component, event, helper) {
        var searchField = component.find('searchField');
        var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        if(isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
        }else{
          // else call helper function 
            helper.SearchHelper(component, event);
        }
    },
})