({
   /* doInit : function(component, evt, helper) {
   
        var action = component.get("c.getParticipantnames");
     //Set up the callback
     action.setCallback(this, function(actionResult) {
            component.set("v.Names", actionResult.getReturnValue());
        	
      	}); 
        $A.enqueueAction(action);  */  
      doInit : function(cmp, evt, helper) {
        helper.showButtons(cmp);      
    },
    
   /* generateReport : function(cmp, evt) {
        var Id = cmp.get('v.ParticpantId');
        alert(Id);
        var courtDate = cmp.get('v.courtDate');
        if (!courtDate) return;
        var nav = $A.get('e.force:navigateToURL');
       nav.setParams({
          
        }); 
        nav.fire();
         url : '/apex/Staffing_Report_page?cd=' + courtDate + '&d=' + docket*/
     generateReport : function(cmp, evt) {
        var docket = evt.getSource().get('v.label');

        var courtDate = cmp.get('v.courtDate');
        if (!courtDate) return;

        var nav = $A.get('e.force:navigateToURL');
        nav.setParams({
              url : '/apex/Staffing_Report_page?id='+ docket+'&cd=' + courtDate
        });
        nav.fire();
    
    }
})