({
    
    fetchListOfRecordTypes: function(component, event, helper) {
        component.set("v.isRecType", true);
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            component.set("v.lstOfRecordType", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    openModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpen", true);
    },
    createRecord: function(component, event, helper) {
        component.set("v.isOpen", true);
        component.set("v.isRecType", false);
        component.set("v.DetialBody",[]);
        var action = component.get("c.getRecTypeId");
        var recordTypeLabel = component.find("selectid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
               /*   createRecordEvent.setParams({
                    "entityApiName": 'Account',
                    "recordTypeId": RecTypeID
                }); 
            createRecordEvent.fire(); */
              if(recordTypeLabel ='Full Project'){
                    $A.createComponent(
                        "c:FullProjectRecordType",
                        {
                            'Rectypeid': recordTypeLabel,
                            'entityApiName':'Account'
                            
                        },
                        function(newcmp){
                            if(component.isValid()){
                                console.log("FullProjectRecordType");
                                component.set("v.DetialBody", newcmp);  
                            }
                            else{
                                component.set("v.DetialBody",[]);
                            }
                        });
                }else if(recordTypeLabel ='Simple Project'){
                    $A.createComponent(
                        "c:SimpleProjectRecordType",
                        {
                            'Rectypeid': recordTypeLabel,
                            'entityApiName':'Account'
                            
                        },
                        function(newcmp){
                            if(component.isValid()){
                                console.log("SimpleProjectRecordType");
                                component.set("v.DetialBody", newcmp);  
                            }
                            else{
                                component.set("v.DetialBody",[]);
                            }
                        });
                }else if(recordTypeLabel ='BaseLine Project'){
                    $A.createComponent(
                        "c:BaseLineProjectRecordType",
                        {
                            'Rectypeid': recordTypeLabel,
                            'entityApiName':'Account'
                            
                        },
                        function(newcmp){
                            if(component.isValid()){
                                console.log("BaseLineProjectRecordType");
                                component.set("v.DetialBody", newcmp);  
                            }
                            else{
                                component.set("v.DetialBody",[]);
                            }
                        });
                } 
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        }); 
        $A.enqueueAction(action);
    },
    
    closeModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpen", false);
    },
})