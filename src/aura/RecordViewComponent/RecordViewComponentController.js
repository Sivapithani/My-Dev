({
	doInit :function(component, event, helper) {
		var action =component.get("c.getContacts");
        action.setCallback(this, function(response){
            action.SetParams({
                
            });
            var state=response.getState();
            if(state == Success){
                 component.set("v.Account",response.getReturnValue());
            }
            /*
                     * editRecord: function(component, event, helper) {
            var recordId = component.get("v.id");
        
            var editRecordEvent = $A.get("e.force:editRecord");
            editRecordEvent.setParams({
                "recordId": recordId
            });
            editRecordEvent.fire();
        }, */
        });
	},
    handleClick:function(component, event, helper) {
         var trecordId = '0010I00001qQCvRQAW';
        alert(trecordId);
        var editRecordEvent = $A.get("e.force:editRecord");
            editRecordEvent.setParams({
                "recordId": trecordId
            });
            editRecordEvent.fire();
    },
    save : function(component, event, helper) {
        component.find("edit").get("e.recordSave").fire();
    },
    handleSaveSuccess : function(component, event) {
        component.set("v.saveState", "SAVED");
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    }
})