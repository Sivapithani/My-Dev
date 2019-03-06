({
	Navigatetocontact : function(component, event, helper) {
        
		var sObjectEvent = $A.get("e.force:navigateToSObject");
        alert('Hi'+component.get("v.Accountid"));
        sObjectEvent.setParams({
            "recordId": component.get("v.Accountid"),
            "slideDevName": 'detail'
        })
        sObjectEvent.fire(); 
	},
    editcontact:function(component, event, helper){
        component.set("v.IsEdit",true);
    },
    handleSubmit:function(component, event, helper){
        component.set("v.IsEdit",false);
    },
    toCancel:function(component, event, helper){
        component.set("v.IsEdit",false);
    },
})