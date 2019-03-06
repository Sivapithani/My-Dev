({
	myAction : function(component, event, helper) {
         
      /* var valuesaccs = [{
                type : 'contact',
                id: component.get("v.recordId"),
                label: 'Account Name', 
                icon : {
                    url:'/img/icon/t4v35/standard/account_120.png',
                    backgroundColor:'65CAE4',
                    alt:'Account'
                }, 
                record: component.get("v.recordId"),
                placeHolder: 'Search Account'
            }];
   component.find("accountLookup").get("v.body")[0].set("v.values", valuesaccs); */
        //component.set("v.selectedLookUpRecord",component.get("v.recordId")) ;  
         
       // alert('@@@@selectedLookUpRecord'+component.get("v.selectedLookUpRecord"));
        // var selectedAccountGetFromEvent = event.getParam("recordByEvent");
	   //component.set("v.selectedLookUpRecord" , selectedAccountGetFromEvent); 
       //helper.handleComponentEvent(component,event,helper);
       //alert('====event==='+component.get("v.selectedLookUpRecord"));

        /* alert('===Account'+component.get("v.contact.AccountId"));
        var values = [{
        type: 'Account',
        id: component.get("v.recordId"),
        label: 'Test', //obviously, you should get this from somewhere, perhaps in your apex controller
        icon : {
            url:'/img/icon/t4v35/standard/account_120.png',
            backgroundColor:'A094ED',
            alt:'Account'
        }
    }];alert('===Account=='+JSON.stringify(values));
        component.set("v.contact.AccountId",defaultid) ; 
         component.find('accountLookup').set('v.values', values);
      */  
        
        
        
		/*var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Contact",
        "recordTypeId": "0120I0000019aAzQAI"
    });
    createRecordEvent.fire(); */
	},
    valueChangeValidation : function(component, event, helper) {
    var inputField = component.find('dateid');
    var value = inputField.get('v.value');
    if(value == '' || value =='undefined' ) {
        inputField.set('v.validity', {valid:false, badInput :true});
        inputField.showHelpMessageIfInvalid();
    }
    },
    openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      component.set("v.isOpen", true);
   },
    myAction1:function(component, event, helper){
      console.log('@@@@isOpenBefore'+component.get("v.isOpen"));
        component.set("v.isOpen", true);
          console.log('@@@@isOpen'+component.get("v.isOpen"));  
    },
    createContact:function(component, event, helper){
       
        
        console.log('Inside_save');
        console.log('lastname : '+component.get("v.contact.LastName"));
        console.log('firstname : '+component.get("v.contact.FirstName"));
        console.log('email : '+component.get("v.contact.Email"));
        console.log('birth : '+component.get("v.contact.Birthdate"));
        console.log('Account : '+component.get("v.selectedLookUpRecord"));
         if(component.get("v.contact.Birthdate") != '')
             component.set("v.dateValidationError" , false);
        else
             component.set("v.dateValidationError" , true);
        
        var isDateError = component.get("v.dateValidationError");
         console.log('isDateError'+isDateError);
        if(isDateError != true){
        var action =component.get("c.createcontact");
        action.setParams({
            lastname:component.get("v.contact.LastName"),
            firstname:component.get("v.contact.FirstName"),
            email:component.get("v.contact.Email"),
            birthdate: new Date(component.get('v.contact.Birthdate')).toJSON()
            
           
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
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
   },
 
   likenClose: function(component, event, helper) {
      // Display alert message on the click on the "Like and Close" button from Model Footer 
      // and set set the "isOpen" attribute to "False for close the model Box.
      alert('thanks for like Us :)');
      component.set("v.isOpen", false);
   },
})