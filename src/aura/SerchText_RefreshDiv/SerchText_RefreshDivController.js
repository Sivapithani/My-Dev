({
    Search : function(component, event, helper) {
        var searchField = component.find('searchField');
        var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        if(isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
        }else{
            // else call helper function 
            component.find("Id_spinner").set("v.class" , 'slds-show');
            component.set("v.resultkey", component.get("v.searchKeyword"));
            var isSearchtext =component.get("v.searchKeyword");
            if(isSearchtext !=''){
                component.set("v.tMessage", true);
                // hide spinner when response coming from server 
                component.find("Id_spinner").set("v.class" , 'slds-hide');
            }else{
                component.set("v.tMessage", false);
                component.find("Id_spinner").set("v.class" , 'slds-hide');
            }
        }
    }
})