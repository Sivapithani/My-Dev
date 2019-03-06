({
	doEdit: function(component, event, helper) {
		helper.editRecord(component);
	},
    navigateToAccount:function(component){
         // it returns only first value of Id
       var AcctId = component.get("v.account.Id");
    
     var sObectEvent = $A.get("e.force:navigateToSObject");
       sObectEvent .setParams({
       "recordId": AcctId,
       "slideDevName": "detail"
      });
      sObectEvent.fire(); 
      },
})