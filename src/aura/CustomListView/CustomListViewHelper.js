({
	listview : function(component, event, helper) {
          var action =component.get("c.getlistview");
		  action.setParams({ });
          action.setCallback(this, function(response){
            var state = response.getState();
            if(state =="SUCCESS"){
                component.set("v.customlist",response.getReturnValue()) ; 
                console.log('Customlist'+component.get("v.customlist"));
            }
        });  
        $A.enqueueAction(action);
	},
    recentrecords:function(component, event, helper) {
        var action1 =component.get("c.recentlyviewrecords");
		  action1.setParams({ });
          action1.setCallback(this, function(response){
            var state = response.getState();
            if(state =="SUCCESS"){
                component.set("v.AccountList",response.getReturnValue()) ; 
                console.log('AccountList'+component.get("v.AccountList"));
            }
        });  
        $A.enqueueAction(action1);
    }
})