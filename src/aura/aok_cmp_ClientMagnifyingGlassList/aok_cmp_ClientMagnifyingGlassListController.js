({
   selectRecord : function(component, event, helper){   
       
       console.log("Record selection done");
       
    // get the selected record from list  
      var getSelectRecord = component.get("v.selectedsrnoterecord");
       console.log('getSelectRecord: ', getSelectRecord);
      var getSelectRecordId= component.get("v.selectedsrnoterecord").Id;
       console.log('getSelectRecordId : '+getSelectRecordId);
       
       
       // COMMENT FOR 
      /* var compEvent1 = component.getEvent("siteLocIdEvent");
    // set the Selected sObject Record to the event attribute.  
         compEvent1.setParams({
             "siteLocationId" : getSelectRecordId              
         });  
    // fire the event  
         compEvent1.fire(); 
       */ 
       
       
    // call the event   
      var compEvent = component.getEvent("aok_evt_oSelectedRecordEvent");
    // set the Selected sObject Record to the event attribute.  
         compEvent.setParams({
             "recordByEvent" : getSelectRecord  ,
 			 "siteLocationId" : getSelectRecordId 
         });  
    // fire the event  
         compEvent.fire();
         
         
    },
})