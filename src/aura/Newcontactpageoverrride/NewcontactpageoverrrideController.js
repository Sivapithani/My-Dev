({
	doInit : function(component, event, helper) {
        alert('hi');
       var action = component.get("c.recordtypename");
        action.setCallback(this, function(a){
            component.set("v.recordTypeobj", a.getReturnValue());
        });
        var rType =component.get("v.recordTypeobj.Name");
        alert('selected Rtype'+rType);
        if(rType =='Flow')
        {
           
            var createContactEvent = $A.get("e.force:createRecord");
            createAcountContactEvent.setParams({
                "entityApiName": "Contact"
            });
           /* createContactEvent.fire();
            var homeEvt = $A.get("e.force:navigateToObjectHome");
            homeEvt.setParams({
                "scope": "Contact"
            });
			homeEvt.fire(); */
        }
        if(rType =='GFI')
        {
           var urlEvent = $A.get("e.force:navigateToURL");
            var rid =component.get("v.recordTypeobj.Id");
            urlEvent.setParams({ "url":"/apex/ContactDetailPage?retURL=%2F003%2Fo&RecordType="+rid }); 
            urlEvent.fire(); 
        }
        	
        
        $A.enqueueAction(action);
	}
        
	
})