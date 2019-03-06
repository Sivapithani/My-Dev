({
    //searchHelper : function(component,event,getInputkeyWord,getRecordTypeName,getSiteLocationId) {
    searchHelper : function( component,event,getInputkeyWord,getRecordTypeName,getSiteLocationId,notInUseRecType,accountRecordSelected,fromlookup ) { 
        
        // GET END USER RECORD ID AND PASS IT TO METHOD fetchLookUpValues
        var endUserId ;
        var EndUserRecordObj = component.get("v.EndUserRecordId");
        for(var item in EndUserRecordObj){
            if(item == "Id"){
                endUserId = EndUserRecordObj[item];                  
            }
        }
        

        var searchedFieldName = component.get("v.searchedFieldName");
        //DEBUG STATEMENT : START
        console.log('######## 1'+getInputkeyWord);
        console.log('######## 2'+component.get("v.objectAPIName"));
        console.log('######## 3'+getRecordTypeName);
        console.log('######## 4'+getSiteLocationId);
        console.log('######## 5'+notInUseRecType);
        console.log('######## 6'+accountRecordSelected);
        console.log('######## 7'+endUserId);
        console.log('######## 8'+component.get("v.caseType"));
        console.log('######## 9'+searchedFieldName);
             
        
        //DEBUG STATEMENT : END
     
        // call the apex class method 
        var action = component.get("c.fetchcaseLookUpValues");  
        //var action = component.get("c.fetchLookUpValues");
        // set param to method  
        action.setParams({
            'searchKeyWord': getInputkeyWord,
            'ObjectName' : component.get("v.objectAPIName"),
            'recordTypeName':getRecordTypeName,
            'SiteLocationId':getSiteLocationId,
            "notInUseRecType":notInUseRecType,
            "accobjId":accountRecordSelected,
            "parentAccId": endUserId,
			"casetypeparam": component.get("v.caseType"),
            "searchedFieldName":searchedFieldName,
            "fromlookup": fromlookup
        }); 
        /*
        action.setParams({
            'searchKeyWord': getInputkeyWord,
            'ObjectName' : component.get("v.objectAPIName"),
            'recordTypeName':getRecordTypeName,
            'SiteLocationId':getSiteLocationId,
            "searchedFieldName":searchedFieldName
        }); */
        // set a callBack    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            if (state === "SUCCESS") {  
                var storeResponse = response.getReturnValue();
                // if storeResponse size is equal 0 ,display No Result Found... message on screen.                }
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", '');
                }
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
                
                var myJSON = JSON.stringify(storeResponse);
                console.log('######## myJSON'+myJSON);
                
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    }
    
})