({
    doInitialization : function(component,event,helper){
        var selectedRecord = component.get("v.selectedRecord");
        console.log("----selectedRecord----");
        console.log(selectedRecord);
        
        if(selectedRecord == null || selectedRecord.Name == undefined){
            console.log("selectedRecord is null");
        }else{
            console.log("selectedRecord is not null");
            var forclose = component.find("lookup-pill");
            $A.util.addClass(forclose, 'slds-show');
            $A.util.removeClass(forclose, 'slds-hide');
            
            var forclose = component.find("searchRes");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
            
            var lookUpTarget = component.find("lookupField");
            $A.util.addClass(lookUpTarget, 'slds-hide');
            $A.util.removeClass(lookUpTarget, 'slds-show'); 
        } 
        
    },
    handleSiteLocIdEvent : function(component,event,helper){
        var selectedSiteLocationId = '';
        var siteLocVar = component.get("v.siteLocationIdVar");  
        if(siteLocVar){
            var selectedSiteLocationId = event.getParam("siteLocationId");
            //var lookupId = component.get("v.selectedSiteLocationId");
            component.set("v.siteLocationId",selectedSiteLocationId);
            var sitelocId = component.get("v.siteLocationId");
            console.log('Site loc Id at event+++ vst test'+sitelocId);
            
        } 
    },
    onfocus : function(component,event,helper){
        $A.util.addClass(component.find("mySpinner"), "slds-show");
        var forOpen = component.find("searchRes");
        //$A.util.addClass(forOpen, 'slds-is-open');
        //$A.util.removeClass(forOpen, 'slds-is-close');
        // Get Default 5 Records order by createdDate DESC  
        var getInputkeyWord = '';
        var getRecordTypeName = ''; 
        var getSiteLocationId='';
        //helper.searchHelper(component,event,getInputkeyWord,getRecordTypeName,getSiteLocationId);
        
    },
    onLookup : function(component,event,helper){
        
        component.set("v.isNew",true);
        var accountRecordSelected = 'none';
        var getInputkeyWord = component.get("v.SearchKeyWord");
        var getRecordTypeName = component.get("v.objectRecordType"); 
        var sitelocId = component.get("v.siteLocationId");
        // helper.searchHelper(component,event,getInputkeyWord,getRecordTypeName,getSiteLocationId);
        helper.searchHelper(component,event,getInputkeyWord,getRecordTypeName,sitelocId,component.get("v.notInUseRecType"),accountRecordSelected,'yes'); 
    },
    cancelWindow : function(component, event, helper){
        component.set("v.isNew",false);     
    },
    saveSAAppointment:function(component, event, helper){
        //component.set("v.isNew",true);
    },
    onblur : function(component,event,helper){       
        component.set("v.listOfSearchRecords", null );
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    keyPressController : function(component, event, helper) {
        // get the search Input keyword
        var accountRecordSelected = 'none';
        var selectedRecordVar = component.get("v.parentRecordId") ;
        var count= 0;
        for( var item in selectedRecordVar){
            count = 1; 
        }
        if(count == 1 ){
            accountRecordSelected = selectedRecordVar;
            console.log("selectedRecordVar inside custom lookup not null --"+accountRecordSelected);
        }
        
        
        var getInputkeyWord = component.get("v.SearchKeyWord");
        var getRecordTypeName =  component.get("v.objectRecordType");
        var sObjectName = component.get("v.objectAPIName") || '';
        //console.log('sObjectName: '+sObjectName);
        var sitelocId = component.get("v.siteLocationId");
        if(sObjectName !== '' && sObjectName == 'Account'){
            var selectedSiteLocationId = event.getParam("siteLocationId");
            //var lookupId = component.get("v.selectedSiteLocationId");
            component.set("v.siteLocationId",selectedSiteLocationId);
            console.log('Site loc Id at JS+++'+selectedSiteLocationId);            
        }
        
        
        
        //var getSiteLocationId = component.get("v.siteLocationId");
        
        console.log('recordtypename===>'+getRecordTypeName);
        // check if getInputKeyWord size id more then 0 then open the lookup result List and 
        // call the helper 
        // else close the lookup result List part.   
        if( getInputkeyWord.length > 0 ){
            var forOpen = component.find("searchRes");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close'); 
            // helper.searchHelper(component,event,getInputkeyWord,getRecordTypeName,sitelocId); 
            helper.searchHelper(component,event,getInputkeyWord,getRecordTypeName,sitelocId,component.get("v.notInUseRecType"),accountRecordSelected,'No'); 
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
            var forclose = component.find("searchRes");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
    // function for clear the Record Selaction 
    clear :function(component,event,heplper){
        
        var selectedsObject = component.get("v.selectedRecord");
        var selectedParentsObjectId = component.get("v.selectedParentsObjectId");
        var opName = "removeRecord";
        var selectedsObjectName = component.get("v.objectAPIName");
        console.log("clear : selectedsObject id : "+selectedsObject.Id);
        console.log("clear : selectedParentsObjectId : "+selectedParentsObjectId);
        console.log("clear : opName  : "+opName);
        console.log("clear : selectedsObjectName :  : "+selectedsObjectName);
        
        
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
        
        $A.util.addClass(pillTarget, 'slds-hide');
        $A.util.removeClass(pillTarget, 'slds-show');
        
        $A.util.addClass(lookUpTarget, 'slds-show');
        $A.util.removeClass(lookUpTarget, 'slds-hide');
        
        component.set("v.SearchKeyWord",null);
        component.set("v.listOfSearchRecords", null );
        component.set("v.selectedRecord", {} );   
        //remove the siteLocationId if the Site Location is removed
        var objectAPIName = component.get('v.objectAPIName') || '';
        if(objectAPIName === 'Account'){
            component.set("v.siteLocationId",'');
        }
        
        // fire event to remove the objects from list in ClientTimeDetail component
        var compEvent = component.getEvent("selectedObjWithParent");
        // set the Selected sObject Record and ts parent record to the event attribute.  
        compEvent.setParams({
            "selectedsObject" : selectedsObject,
            "selectedParentsObjectId" : selectedParentsObjectId,
            "opName" : opName,
            "selectedsObjectName":selectedsObjectName             
        });  
        // fire the event  
        compEvent.fire();
    },
    
    // This function call when the end User Select any record from the result list.   
    handleComponentEvent : function(component, event, helper) {
        // COMMENT FOR TESTING
        console.log("handle component called");
        //var selectedSiteLocationId = event.getParam("siteLocationId");
        
        console.log("handle component called 1");
        
        // get the selected Account record from the COMPONETN event 	 
        var selectedAccountGetFromEvent = event.getParam("recordByEvent");
        component.set("v.selectedRecord" , selectedAccountGetFromEvent); 
        
        console.log("handle component called 2");
        
        // COMMENT FOR TESTING        	
        
        var forclose = component.find("lookup-pill");
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
        
        console.log("handle component called 3");
        
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
        
        console.log("handle component called 4");
        
        var lookUpTarget = component.find("lookupField");
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show');
        
        console.log("handle component called 5");
        
        var selectedsObject = component.get("v.selectedRecord"); console.log("handle component called 6");
        var selectedParentsObjectId = component.get("v.selectedParentsObjectId"); console.log("handle component called 7");
        var opName = "addRecord";
        var selectedsObjectName = component.get("v.objectAPIName");
        console.log("lookup : selectedsObject id :: "+selectedsObject.Id);
        console.log("lookup : selectedParentsObjectId :: "+selectedParentsObjectId);
        // call the event   
        var compEvent = component.getEvent("selectedObjWithParent");
        // set the Selected sObject Record and its parent record to the event attribute.  
        compEvent.setParams({
            "selectedsObject" : selectedsObject,
            "selectedParentsObjectId" : selectedParentsObjectId,
            "opName" : opName,
            "selectedsObjectName":selectedsObjectName             
        });  
        // fire the event  
        compEvent.fire();
        
        component.set("v.isNew",false);
    },
})