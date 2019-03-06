({
	 SearchHelper: function(component, event) {
        // show spinner message
        component.find("Id_spinner").set("v.class" , 'slds-show');
         component.set("v.resultkey", component.get("v.searchKeyword"));
         var isSearchtext =component.get("v.searchKeyword");
         if(isSearchtext !=''){
               component.set("v.tMessage", true);
         }else{
             component.set("v.tMessage", false);
         }
        var action = component.get("c.fetchAccount");
        action.setParams({
            'searchKeyWord': component.get("v.searchKeyword")
        });
        action.setCallback(this, function(response) {
            // hide spinner when response coming from server 
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              component.get("v.resultkey", component.get("v.searchKeyword"));
                // if storeResponse size is 0 ,display no record found message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", true);
                    
                } else {
                    component.set("v.Message", false);
                }
                 //component.set("v.tMessage", true);
                  
                // set searchResult list with return value from server.
                component.set("v.AccountList", storeResponse); 
          
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                              errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
    
})