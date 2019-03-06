({
    
    doInit: function(component, event, helper) {
      // call the fetchPickListVal(component, field_API_Name, aura_attribute_name_for_store_options) -
      // method for get picklist values dynamic   
        //helper.fetchPickListVal(component, 'Rating', 'ratingPicklistOpts');
    },
    
    inlineEditfName : function(component,event,helper){   
        // show the name edit field popup 
        component.set("v.FristnameEditMode", true); 
         //var currentRecordId = event.target.id; 
        //alert('currentRecordId'+currentRecordId);
       //component.set("v.Selectedcon",currentRecordId);
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ 
            component.find("FirstNameid").focus();
        }, 100);
    },
    
    inlineEditlName : function(component,event,helper){   
        // show the rating edit field popup 
        component.set("v.LastNameEditMode", true); 
        //var currentRecordId = event.target.id; 
        //alert('currentRecordId'+currentRecordId);
       // component.set("v.Selectedcon",currentRecordId);
        // after set ratingEditMode true, set picklist options to picklist field 
        //component.find("accRating").set("v.options" , component.get("v.ratingPicklistOpts"));
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ 
            component.find("LastNameid").focus();
        }, 100);
    },
    
     onfNameChange : function(component,event,helper){ 
        // if edit field value changed and field not equal to blank,
        // then show save and cancel button by set attribute to true
        if(event.getSource().get("v.value").trim() != ''){ 
            component.set("v.showSaveCancelBtn",true);
        }
    },
 
    onLastNameChange : function(component,event,helper){ 
        // if picklist value change,
        // then show save and cancel button by set attribute to true
        component.set("v.showSaveCancelBtn",true);
    },     
    
    closefNameBox : function (component, event, helper) {
      // on focus out, close the input section by setting the 'nameEditMode' att. as false   
        component.set("v.FristnameEditMode", false); 
      // check if change/update Name field is blank, then add error class to column -
      // by setting the 'showErrorClass' att. as True , else remove error class by setting it False   
        if(event.getSource().get("v.value").trim() == ''){
            component.set("v.showErrorClass",true);
        }else{
            component.set("v.showErrorClass",false);
        }
    }, 
    
    closelNameBox : function (component, event, helper) {
       // on focus out, close the input section by setting the 'ratingEditMode' att. as false
        component.set("v.LastNameEditMode", false); 
    },
    Save: function(component, event, helper) {
     //alert("In Save "+component.get("v.Selectedcon"));
              // call the saveAccount apex method for update inline edit fields update 
               var action = component.get("c.savecon");
                  action.setParams({
                    'con': component.get("v.singleRec")
                  });
            // alert("In Save1 ");
            action.setCallback(this, function(response) {
                var state = response.getState();
                 //alert("In state "+state);
                if (state == "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    // set AccountList list with return value from server.
                    component.set("v.Selectedcon", storeResponse);
                    // Hide the save and cancel buttons by setting the 'showSaveCancelBtn' false 
                    component.set("v.showSaveCancelBtn",false);
                    //alert('Updated...');
                }
            });
            $A.enqueueAction(action);
        
    },
    cancel : function(component,event,helper){
       // on cancel refresh the view (This event is handled by the one.app container. It’s supported in Lightning Experience, the Salesforce app, and Lightning communities. ) 
        $A.get('e.force:refreshView').fire(); 
    } 
    
   
})