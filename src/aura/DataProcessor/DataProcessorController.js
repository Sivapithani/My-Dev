/* Component controller */
({ 
    doInit : function(component, event, helper) {       
      helper.getcontacts(component);
   }, 
    downloadDocument : function(component, event, helper){
        alert('Inside Download @@');
        var sendDataProc = component.get("v.sendData");
        alert('sendDataProc@@'+sendDataProc);
        var condata =  component.get("v.contacts")
        var dataToSend = {
           condata
        }; //this is data you want to send for PDF generation
        
        //invoke vf page js method
        sendDataProc(dataToSend, function(){
            //handle callback
       });
    },
   
})