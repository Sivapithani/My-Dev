({
	saveMaster : function(component, event, helper) {

    var master = component.get("v.master");
        
    var action = component.get("c.saveRecorddetails");
    action.setParams({name:component.get("v.master.Name"),
            firstname:component.get("v.master.LastName__c"),
            email:component.get("v.master.Email__c"),
            tdate:component.get("v.master.Due_Date__c")
                     
                     });

    console.log("mastera ---->" + JSON.stringify(master));

    action.setCallback(this, function(response){
       var state = response.getState();
        if(state == "SUCCESS" && component.isValid()){
           console.log("success") ;

        }
        else{
            console.log("failed  ::: " + response.getError()[0].message); // Unable to read sObject

        }

    });

    $A.enqueueAction(action);


},
    saveMaster1 : function(component, event, helper) {

    var master = component.get("v.master");
        
    var action1 = component.get("c.saveRecord");
        action1.setParams({mas:master
                     
                     });

    console.log("mastera ---->" + JSON.stringify(master));

    action1.setCallback(this, function(response){
       var state = response.getState();
        if(state == "SUCCESS" && component.isValid()){
           console.log("success") ;

        }
        else{
            console.log("failed  ::: " + response.getError()[0].message); // Unable to read sObject

        }

    });

    $A.enqueueAction(action1);
    }
})