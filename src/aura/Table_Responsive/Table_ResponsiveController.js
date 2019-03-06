({
    
    doInit : function(component, event, helper) {
         var action = component.get('c.getoppty'); 
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.opptylist', a.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
        
    },
    showaction:function(component, event, helper) {
        
        alert('Show Actions.....');
        component.set("v.showaction",false);
        component.set("v.txsize",'-80% ');
        component.set("v.layout",'open ');
        alert('Show Actions.....2');
    },
    hideactions:function(component, event, helper) {
        
        component.set("v.showaction",true);
        component.set("v.txsize",'0% ');
        component.set("v.layout",'');
    },
    LaodScript:function(component, event, helper){
        $(body).ready(function(){
            $(body).mousemove(function(event){
                $("span").text(event.pageX + ", " + event.pageY);
            });
        });
    }
})