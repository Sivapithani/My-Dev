({
	doInit : function(component, event, helper) {
        alert('Hi');

        //var today = $A.localizationService.formatDate(new Date(), "MM/DD/YYYY");
        //alert('date'+today);
        //var today = new Date();
        //alert('date'+today);
		//component.set("v.today",today);
        //component.set("v.today", today.getMonth()+ "/" + today.getDate() + "/" +today.getFullYear() );
        var today = new Date();
        component.set('v.today', today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate());
         // component.set('v.today', today);
    },
	
    detailstab :function(component, event, helper) {
        var dttab = component.find('detailId');
        var TabOnedata = component.find('detail_Id');
        var rltab =component.find('relatedId');
        var TabTwodata = component.find('related_Id');
        //show and Active details tab
        $A.util.addClass(dttab, 'slds-active');
        $A.util.addClass(TabOnedata, 'slds-show');
        $A.util.removeClass(TabOnedata, 'slds-hide');
        // Hide and deactivate  tab
        $A.util.removeClass(rltab, 'slds-active');
        $A.util.removeClass(TabTwodata, 'slds-show');
        $A.util.addClass(TabTwodata, 'slds-hide');
    },
     relatedtab :function(component, event, helper) {
         var dttab = component.find('detailId');
        var TabOnedata = component.find('detail_Id');
        var rltab =component.find('relatedId');
        var TabTwodata = component.find('related_Id');
        //show and Active details tab
        $A.util.addClass(rltab, 'slds-active');
         $A.util.removeClass(TabTwodata, 'slds-hide');
        $A.util.addClass(TabTwodata, 'slds-show');
       
        // Hide and deactivate  tab
        $A.util.removeClass(dttab, 'slds-active');
        $A.util.removeClass(TabOnedata, 'slds-show');
        $A.util.addClass(TabOnedata, 'slds-hide');
    },
    handleSelect: function (cmp, event, helper) {
        // This will contain the string of the "value" attribute of the selected
        // lightning:menuItem
        var selectedMenuItemValue = event.getParam("value");
        alert("Menu item selected with value: " + selectedMenuItemValue);
    },
    handleclose:function (component, event, helper) {
       // var recordId = component.get('v.recordId');
       // alert('recordId'+recordId);
        //  var  navEvt = $A.get("e.force:navigateToSObject");
           // navEvt.setParam("recordId", recordId);
       
        // navEvt.fire();
        component.set("v.isback",true);
        component.set("v.isview",false);
    },
    navigateto:function(component, event, helper){
         console.log('Enter Here');
        var evt = $A.get("e.force:navigateToComponent");
        console.log('evt'+evt);
        evt.setParams({
            componentDef: "c:Create_Contact",
            componentAttributes :{ 
                recordId: component.get('v.recordId')
            }
        });
       
        evt.fire(); 
        //component.set('v.isview',false);
    },
     createContact:function(component, event, helper){
        console.log('Inside_save');
        console.log('lastname : '+component.get("v.contact.LastName"));
        console.log('firstname : '+component.get("v.contact.FirstName"));
        console.log('email : '+component.get("v.contact.Email"));
        console.log('birth : '+component.get("v.contact.Birthdate"));
        console.log('Account : '+component.get("v.selectedLookUpRecord"));
        var action =component.get("c.createcontact");
        action.setParams({
            lastname:component.get("v.contact.LastName"),
            firstname:component.get("v.contact.FirstName"),
            email:component.get("v.contact.Email"),
            birthdate: new Date(component.get('v.contact.Birthdate')).toJSON(),
            taccount:component.get("v.selectedLookUpRecord")
           
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state =="SUCCESS"){
                component.set("v.contact",response.getReturnValue()) ; 
                var sObectEvent = $A.get("e.force:navigateToSObject");
                alert('Contact Id'+ component.get("v.contact.Id"));
                sObectEvent .setParams({
                    "recordId": component.get("v.contact.Id"),
                    "slideDevName": "details"
                });
                sObectEvent.fire();
            }
        });  
        $A.enqueueAction(action);
    }
})