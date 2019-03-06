({
	doOnload : function(component, event, helper) {
        var action = component.get("c.getAllApps");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("From server: " +JSON.stringify(response.getReturnValue()) );
                component.set("v.appList", response.getReturnValue());
            }
        
        });
        $A.enqueueAction(action);
	},
	navigateToApp : function(component, event, helper) {
		console.log("navigateToApp called");
        /*var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": "https://mylighningacademy-dev-ed.lightning.force.com/lightning/page/home"
        });
        urlEvent.fire();*/
        var app1 = event.srcElement.dataset.appid ; //event.target.dataset.appid;
        console.log('data app1 = '+ app1);
	},    
})