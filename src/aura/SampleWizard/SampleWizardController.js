({
    nextTab : function(component, event, helper) {
        alert('in nexttab');
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showScreen1");
        var showContact = component.get("v.showScreen2");
        var showOpportunity = component.get("v.showScreen3");
        var showData = component.get("v.showData");
        
        
        if(showAccount == true){
             alert('in Screen1');
            var accountName = component.find("Name").get("v.value");
            console.log('accountName:::'+accountName);
            if(accountName =='' || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { alert('in error');
                component.set("v.showScreen2",false);
                component.set("v.showScreen3", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { alert('in Screen2');
                component.set("v.showScreen1", false);
                component.set("v.showScreen2", true);
                component.set("v.showScreen3", false); 
                component.set("v.showError", false);
                component.set("v.showData", false);
                
                
            }
            
        }    
        if(showContact == true){
            alert('in Screen2');
            var lastName = component.find("LastName").get("v.value");
            console.log('lastName:::'+lastName);
            if(lastName =='' || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showScreen1", false);
                component.set("v.showScreen2", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
                
            }
            else
            { alert('in Screen3');
                component.set("v.showScreen1", false);
                component.set("v.showScreen2", false);
                component.set("v.showScreen3", true);
                component.set("v.showError", false);
                component.set("v.showData", false);
                
                
            }
        }   
        
        if(showOpportunity == true){
           // var OpportunityName = component.find("OpportunityName").get("v.value");
            //console.log('OpportunityName:::'+OpportunityName);
           // var StageName = component.find("StageName").get("v.value");
           // console.log('StageName:::'+StageName);
            var closeDate = component.find("closeDate").get("v.value");
            console.log('closeDate:::'+closeDate);
          //  if((OpportunityName =='' || OpportunityName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
              //  component.set("v.setMessage",'error');           
          //  }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showScreen1", false);
                component.set("v.showScreen2", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showScreen3", false);
                component.set("v.showScreen12", false);
                component.set("v.showScreen1", false)
                component.set("v.showError", false);
                component.set("v.showData", true);
                
            }
        }   
        
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showScreen1");
        var showContact = component.get("v.showScreen2");
        var showOpportunity = component.get("v.showScreen3");
        var showData = component.get("v.showData");
        
        
        if(showContact == true){
            component.set("v.showScreen1", true);
            component.set("v.showScreen2", false);
            component.set("v.showScreen3", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        }    
        if(showOpportunity == true){
            component.set("v.showScreen1", false);
            component.set("v.showScreen2", true);
            component.set("v.showScreen3", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        } 
        if(showData == true){
            component.set("v.showScreen1", false);
            component.set("v.showScreen2", false);
            component.set("v.showScreen3", true);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        }  
    },
    
    onSelectChange : function(component, event, helper) {
        var selected = component.find("StageName").get("v.value");
        component.set("v.OpportunityData.StageName",selected);
        console.log('opp::::'+JSON.stringify(selected));
    },
    
    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    }
})