({
    doInit: function(component, event, helper) {
        alert('In Doinit');
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            component.set("v.lstOfRecordType", response.getReturnValue());
          //  alert('@@RType'+component.get("v.lstOfRecordType"));
        });
        $A.enqueueAction(action);
         //alert('@@dealid'+component.get("v.recordId"));
         var action1 = component.get("c.getdefaultvalues");
         action1.setParams({
            "dealId": component.get("v.recordId")
        });  
        action1.setCallback(this, function(response) {
            component.set("v.Deal", response.getReturnValue());
           // alert('@@Deal'+component.get("v.Deal"));
        });
        $A.enqueueAction(action1);
    },
    closeModelForRecTypeSelection: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
        component.set("v.isOpenRecType", false);
        component.set("v.ShowScreen1", true);
    },
    opptyScreen1:function(component, event, helper){
        component.set("v.isOpenRecType", false);
        component.set("v.ShowScreen1", true);
        //alert('@@Deal');
        
        
         //var RecTypeID ;
        var action = component.get("c.getrecordtypeid");
         //alert('@@Deal@@');
        var recTypeLabel = component.find("selectid").get("v.value");
        //var recval =recTypeLabel.get("v.value");
        //alert(recTypeLabel+'recval###');
        component.set("v.recordtypeLable",recTypeLabel);
        action.setParams({
            "recordTypeLabel": recTypeLabel
        });  
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("first callbak "+ response.getReturnValue() );
                var RecTypeID  = response.getReturnValue();
                alert(RecTypeID);
                
                component.set("v.recordtypeid",RecTypeID);
            }
            else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
    /*  var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Opportunity",
            "defaultFieldValues":{
                "Parent_id" : component.get("v.Parent_id"),
                "Name" :component.get("v.Deal").name,
                "AccountId" : component.get("v.Deal").Account__c,
                "ContactId" : component.get("v.Deal").Principal_Contact__c
            },
            "recordTypeId": component.get("v.recordtypeid")
        })  */
        //alert('after new oppty');
    },
    handleClick:function(component, event, helper){}
    
    
    
})