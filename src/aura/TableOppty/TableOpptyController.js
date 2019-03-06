({
    doInit:function(component,event,helper) {
        component.set("v.HomeBody", []); 
        //alert('Hi In doinit ');
        var action1 = component.get("c.getOpportunity");
        action1.setParams({ oppId : component.get("v.recordId")});
        action1.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.oppty",response.getReturnValue());
                var temp=component.get("v.oppty");
                component.set("v.MainCompetitor",temp.MainCompetitors__c);
            }
        }); 
        $A.enqueueAction(action1);
    },
    saveRecord:function(component,event,helper) {
       
        var id =component.get("v.recordId");
        //var MCompetitortemp=document.getElementById("test").value;
        //var MCompetitortemp =component.find("name").get("v.value");
        var action = component.get("c.getOpportunityAmount");
        action.setParams({ oppId : component.get("v.recordId"),
                          MCompetitor : component.get("v.MainCompetitor"),
                         });
        action.setCallback(this, function(response) {
            
            if (response.getState() === "SUCCESS"){
             /* var a = component.get('c.doInit');
                alert('Doinit@2'+a);
       		 $A.enqueueAction(a); */
              component.set("v.showComp",false);
                component.set("v.HomeBody", []);  
                $A.createComponent(
                    "c:TableOppty",
                    {  recordId : component.get("v.recordId"),
                     MainCompetitor:component.get("v.MainCompetitor")              
                    },
                    function(newCmp){
                        if (component.isValid()) {
                            var body = component.get("v.HomeBody");
                            body.push(newCmp);
                            component.set("v.HomeBody", body);  
                        }
                        else{
                            component.find("newCmp").set("v.HomeBody",[]);
                        }});
  
          }
        }); 
        $A.enqueueAction(action);
    },
    onSingleSelectChange: function(cmp) {
        //alert('hi');
        var selectCmp = cmp.find("InputSelectSingle");
        var resultCmp = cmp.find("singleResult");
        resultCmp.set("v.value", selectCmp.get("v.value"));
    },
    inputchange:function(component,event,helper){
        document.getElementById("inputtext").style.backgroundColor= 'red';
    },
    uiInputChange:function(component,event,helper){
       // var inputId=component.find("Inputui");
       // alert('id:'+inputId);
       // inputId.style.backgroundColor="blue";
       document.getElementById("test").style.backgroundColor = "red";
	
    }
    
})