({
	doInit : function(component, event, helper) {
         helper.listview(component, event, helper);
         helper.recentrecords(component, event, helper);
	},
    navigatetolistview:function(component, event, helper) {
        alert('inlist');
    },
    navigatetodetailview:function(component, event, helper){
         alert('inDetail view');
    }
})