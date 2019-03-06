({
    doInit:function(component, event, helper) {
         var action1 = component.get("c.getservicesdata");
        action1.setParams({
          
        });
        action1.setCallback(this, function(response){
            var state = response.getState();
            
                var result = response.getReturnValue();
            //var result =JSON.stringify(result1);
             //alert(jsonstring);
            var plValues = [];
                for (var i = 0; i < result.length; i++) {
                    //alert(result[i].id);
                    plValues.push({
                        label: result[i].name,
                        value: result[i].name
                    });
                }
                component.set("v.ServiecList", plValues);
               //alert('GenreList@@'+component.get("v.ServiecList"));
        });  
        $A.enqueueAction(action1);
         //helper.getservices(component, event, helper);
    },
    
    nextTab : function(component, event, helper) {
        
       
        helper.getclients(component, event, helper);
       // alert('test');
        component.set("v.firstScreen", false);
        component.set("v.secondScreen", true);
    },
    
    prevTab : function(component, event, helper) {
        component.set("v.firstScreen", true);
        component.set("v.secondScreen", false);        
    },
    nextThirdTab : function(component, event, helper) {
        component.set("v.thirdScreen", true);
        component.set("v.secondScreen", false);        
    },
    prevSecondTab : function(component, event, helper) {
        component.set("v.thirdScreen", false);
        component.set("v.secondScreen", true);        
    },
    
    nextFourthTab : function(component, event, helper) {
        component.set("v.thirdScreen", false);
        component.set("v.fourthScreen", true);        
    },
    prevThirdTab : function(component, event, helper) {
        component.set("v.thirdScreen", true);
        component.set("v.fourthScreen", false);        
    },
    
    onSelectChange : function(component, event, helper) {
        var selected = component.find("StageName").get("v.value");
        component.set("v.OpportunityData.StageName",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },
    
    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    },
    onMultiSelectChange : function(component,event,helper){
        var selectedLC = component.find("InputSelectMultiple").get("v.value");  
        //component.set("v.selectdclient", selectedLC);
        component.set("v.selectdclient", selectedLC.toString());
       
        alert('clientid'+ component.get("v.selectdclient"));
    },
    handleGenreChange:function(component,event,helper){
        var selectedValues = event.getParam("value");
         
        //Update the Selected Values  
        component.set("v.selectedGenreList", selectedValues);
    }
})