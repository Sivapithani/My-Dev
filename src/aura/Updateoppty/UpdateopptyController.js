({
    doInit : function(component, event, helper) {
        var id =component.get("v.recordId");
        
        //alert(id+'   '+component.get("v.oppAmount"));
        var action = component.get("c.getOpportunityAmount");
        action.setParams({ oppId : component.get("v.recordId"),
                         Amount : component.get("v.oppAmount")});
        action.setCallback(this, function(response) {
            // alert('success'+response.getState());
            if (response.getState() === "SUCCESS"){
                component.set("v.Isclick", false);
            }
        }); 
        $A.enqueueAction(action);
    },
    editrecord:function(component, event, helper) {
        component.set("v.Isclick", true); 
    }
})