({
    inlineEdit : function(component,event,helper){   
        // show the name edit field popup 
        component.set("v.EditMode", true); 
        var currentRecordId = event.target.id; 
        alert('###currentRecordId###'+currentRecordId);
        component.set("v.SelectedId",currentRecordId);
    },
    update : function(component,event,helper) {
      
          console.log('Id'+component.get("v.SelectedId"));
        var action1 = component.get('c.updateAccount');
        // pass the all selected record's Id's to apex method 
        alert('###currentRecordId###'+component.get("v.SelectedId"));
        action1.setParams({
            "accid": component.get("v.SelectedId")
        });
        action1.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(state);
                if (response.getReturnValue() != '') {
                     
                    console.log('check it--> updated successful');
                    $A.get('e.force:refreshView').fire(); 
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Success!",
                        "type": "success",
                        "message": "Account updated."
                    });
                    toastEvent.fire();
                }
                // call the onLoad function for refresh the List view    
                //this.onLoad(component, event);
            }
        });
        $A.enqueueAction(action1);
         component.set("v.EditMode", false); 
    },
})