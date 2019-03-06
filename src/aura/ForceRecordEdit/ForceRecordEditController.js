({
    doInit:function(component, event, helper) {
       var action =component.get("c.getServiceName");
        action.setParams({
            serviceId:component.get("v.Serviceid")
        });
        
        action.setCallback(this,function(response){
            var status=response.getState();
            console.log('State'+status);
            if(status =="SUCCESS"){
                console.log('Response'+response.getReturnValue());
                component.set("v.ServiceName",response.getReturnValue());
            }
            
        });
         // enqueue the Action  
        $A.enqueueAction(action);
    },
    save : function(component, event, helper) {
        component.find("edit").get("e.recordSave").fire();
        component.set("v.editActive", false);
        $A.get('e.force:refreshView').fire();

    },
    handleSaveSuccess : function(component, event) {
        component.set("v.saveState", "SAVED");
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    },
    cancel: function(component, event, helper)
    {
        component.set("v.editActive", false);
    },
    
})