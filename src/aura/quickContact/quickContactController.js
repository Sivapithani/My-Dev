({
	doInit : function(component, event, helper) {
        alert('Hi'+component.get("v.recordId"))
		var action = component.get("c.getAccount");
        action.setParams({'accountID':component.get("v.recordId")});
        action.setCallback(this ,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.Account",response.getReturnValue());
                //alert(component.get("v.Account"));
                //alert(component.get("v.Account.name"));
            }else{
                console.log("problem getting account,resposne state:"+state);
            }
        });
        $A.enqueueAction(action);
	},
    handelcancel:function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
	},
    handelSaveContact:function(component, event, helper) {
		if(helper.validateContactForm(component)) {
        var saveContactAction=component.get("c.saveContactWithAccount");
        saveContactAction.setParams({
            "newcontact":component.get("v.Newcontact"),
            "accountid":component.get("v.recordId")});
        saveContactAction.setCallback(this, function(response){
            var state= response.getState();
            if(state= 'SUCCESS'){
                var resultToast =$A.get("e.force.showToast");
                resultToast.setParams({
                    'Title':"Contact saved",
                    'message':"The new contact was created."
                });
                $A.get("e.force:closeQuickAction").fire();
                resultToast.fire();
                $A.get("e.force:refreshView").fire();
            }else if(state== "ERROR") {
                console.log("The problem saving contact ,response state"+state);
            }else{
                console.log('Unknown problem ');
            }
        
        });
        $A.enqueueAction(saveContactAction);
	}
    },
})