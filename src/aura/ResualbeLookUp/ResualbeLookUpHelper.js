({
	searchHelper : function(component,event,getInputkeyWord) {
	  // call the apex class method 
     var action = component.get("c.fetchLookUpValues");
      // set param to method  
        action.setParams({
            'searchKeyWord': getInputkeyWord,
            'ObjectName' : component.get("v.objectAPIName")
          });
      // set a callBack    
        action.setCallback(this, function(response) {
          $A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              // if storeResponse size is equal 0 ,display No Result Found... message on screen.                }
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", '');
                }
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
            }
 
        });
      // enqueue the Action  
        $A.enqueueAction(action);
    
	},
    getAccountname: function(component,event,helper){
        var action1 = component.get("c.getAccountName");
         action1.setParams({
            'recordid' : component.get("v.record")
          });
       // alert('=====1');
         action1.setCallback(this, function(response) {
        var state = response.getState();
            // alert('=====3'+state);
            if (state === "SUCCESS") {
                // alert('=====2');
                var storeResponse = response.getReturnValue();
                component.set("v.SearchKeyWord",storeResponse);
               // alert('AccName++'+component.get("v.SearchKeyWord"));
                
            }
     }); 
      // enqueue the Action  
        $A.enqueueAction(action1); 
}
})