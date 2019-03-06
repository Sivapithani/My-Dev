({
   doInit : function(component, event, helper) {       
      helper.getcontacts(component);
   },
    redirectToSobject:function(component, event, helper) {
        var selectedItem = event.currentTarget;
        var IdP = selectedItem.dataset.record;
        
        if ((typeof sforce != 'undefined') && sforce && (!!sforce.one))
            sforce.one.navigateToSObject(IdP);
        else{
            location.href = '/' + IdP;
      }
  
    } ,
})