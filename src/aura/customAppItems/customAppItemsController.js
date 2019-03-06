({
	navigateToApp : function(component, event, helper) {
		console.log("navigateToApp called");
        var urlEvent = $A.get("e.force:navigateToURL");
        /* var app1 = event.srcElement.dataset.appid ; //event.target.dataset.appid;
        console.log('data app1 = '+ app1);
        alert('data app1 = '+ app1);*/
        var entryId = event.currentTarget.dataset.id;
        console.log('entryId app1 = '+ entryId);
        
        urlEvent.setParams({
          "url": "https://sivap-dev-ed.my.salesforce.com/home/home.jsp?tsid="+entryId
        });
        urlEvent.fire();
       
	},
})