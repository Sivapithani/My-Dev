({ 
    doInit: function(component, event, helper){ 
      
    } ,
    saveNewcontact:function(component, event, helper){
        
        var action = component.get("c.fetchContact");
        var accid =component.get('v.contacts.AccountId');
        alert('Hii====Id'+accid);
      action.setParams({
         "AccountId": accid
      });
        // set a callBack
        action.setCallback(this, function(response) {
            var state = response.getState();
		});
        // enqueue the Action
        $A.enqueueAction(action);  
    }
  })