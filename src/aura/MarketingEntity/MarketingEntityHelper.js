({
	callactivity : function(component, event, helper) {
		var action =component.get("c.getactivity");
        
        action.setParams({
            contactid:component.get("v.recordId")
       
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state =="SUCCESS"){
               // component.set("v.activityid",response.getReturnValue()) ; 
                 component.set("v.fullfilment",response.getReturnValue()) ; 
                
            }
        });  
        $A.enqueueAction(action);
	},
    callfullfilment: function(component, event, helper) {
        alert('hi');
        var aid=component.get("v.activityid");
        alert('aid'+aid);
		var action1 =component.get("c.getfullfillment");
        action.setParams({
            acctid:aid
       
        });
        action1.setCallback(this, function(response){
             alert('hi2');
            var state = response.getState();
            if(state =="SUCCESS"){
                component.set("v.fullfilment",response.getReturnValue()) ; 
                
            }
        });  
        $A.enqueueAction(action1);
	}
})