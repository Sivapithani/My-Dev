({
 navigate: function(component, event, helper) {
  var sobjectId = event.getParam("recordId");
    console.log(sobjectId);
     /* if (sobjectId.indexOf("003") >-1) { //Note 500 is prefix for Case Record
      
       var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": '/contact/'+sobjectId+'/view',
            "isredirect" :false
        });
       */
        console.log('if loop');
        component.set("v.contactId",sobjectId);
        console.log(component.get("v.contactId"));
        component.set("v.isDetail",true);
        component.set("v.isListview",false);
  },
    clickback: function(component, event, helper) {
        component.set("v.isDetail",false);
        component.set("v.isListview",true);
    }
})