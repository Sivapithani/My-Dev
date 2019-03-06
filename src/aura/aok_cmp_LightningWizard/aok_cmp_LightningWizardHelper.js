({
    saveData : function(component, event, helper) {
        var action = component.get("c.save");
        action.setParams({
            accountData : component.get("v.accountData"),
            contactData : component.get("v.contactData"),
            opportunityData : component.get("v.opportunityData")}
                        );
        action.setCallback(this, function(response){
            var state = response.getState();
                var message = response.getReturnValue();
                console.log("message>>>>>>>>" +JSON.stringify(message));
                component.set("v.message", message);
            if(message == 'record successfully insert'){
                document.getElementById("showErrorrTractConfig").style.display = "none";
                document.getElementById("showMessageTractConfig").style.display = "block";
            }else{
                document.getElementById("showMessageTractConfig").style.display = "none";
                document.getElementById("showErrorrTractConfig").style.display = "block";
            }    
        });  
        $A.enqueueAction(action);
    },
    getservices:function(component, event, helper) {
    
        var action1 = component.get("c.getservicesdata");
        action1.setParams({
          
        });
        action1.setCallback(this, function(response){
            var state = response.getState();
           // alert('state@@'+state);
                var result = response.getReturnValue();
            var plValues = [];
                for (var i = 0; i < message.length; i++) {
                    plValues.push({
                        label: result[i].name,
                        value: result[i].name
                    });
                }
                component.set("v.GenreList", plValues);
              
        });  
        $A.enqueueAction(action1);
        
    },
    getclients:function(component, event, helper) {
       // alert('state@@'+component.get("v.selectedLookUpRecord2"));
        var action2 = component.get("c.getClientdata");
        action2.setParams({
            clientid:component.get("v.selectedLookUpRecord2")
        });
        action2.setCallback(this, function(response){
            var state = response.getState();
           // alert('state@@'+state);
                var message = response.getReturnValue();
            //alert('Data'+message);
            component.set("v.clientData",message );
              
        });  
        $A.enqueueAction(action2);
        
    }
})