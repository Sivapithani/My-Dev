({
	backtoMain : function(component, event, helper) {
	 component.set("v.isRecType",false);
      component.set("v.HomeBody",[]);
        $A.createComponent(
                "c:NewAccount",
                {
                    
                    
                },
                function(newcmp){
                    if(component.isValid()){
                        console.log("NewAccount");
                        component.set("v.HomeBody", newcmp);  
                    }
                    else{
                        component.set("v.HomeBody",[]);
                    }
                });
	}
})