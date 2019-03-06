({
    doInit: function (cmp, event, helper) {
    var items = [{
            "label": "Western Sales Director",
            "name": "1",
            "expanded": true,
            "items": [{
                "label": "Western Sales Manager",
                "name": "2",
                "expanded": true,
                "items" :[{
                    "label": "CA Sales Rep",
                    "name": "3",
                    "expanded": true,
                    "items" : []
                },{
                    "label": "OR Sales Rep",
                    "name": "4",
                    "expanded": true,
                    "items" : []
                }]
            }]
        }, {
            "label": "Eastern Sales Director",
            "name": "5",
            "expanded": false,
            "items": [{
                "label": "Easter Sales Manager",
                "name": "6",
                "expanded": true,
                "items" :[{
                    "label": "NY Sales Rep",
                    "name": "7",
                    "expanded": true,
                    "items" : []
                }, {
                    "label": "MA Sales Rep",
                    "name": "8",
                    "expanded": true,
                    "items" : []
                }]
            }]
        }];
        cmp.set('v.items', items);
    }  ,
    loadOptions: function (component, event, helper) {
        var options = [
            { value: "new", label: "New" },
            { value: "in-progress", label: "In Progress" },
            { value: "finished", label: "Finished" }
        ];
        component.set("v.statusOptions", options);
    },
    handleChange: function (cmp, event) {
        // Get the string of the "value" attribute on the selected option
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    },
     initialize: function (component, event, helper) {
        var options = [
            { value: "1", label: "Option 1" },
            { value: "2", label: "Option 2" },
            { value: "3", label: "Option 3" },
            { value: "4", label: "Option 4" },
            { value: "5", label: "Option 5" },
            { value: "6", label: "Option 6" },
            { value: "7", label: "Option 7" },
            { value: "8", label: "Option 8" },
        ];
        var values = ["7", "2", "3"];
        var required = ["2", "7"];
        component.set("v.listOptions", options);
        component.set("v.defaultOptions", values);
        component.set("v.requiredOptions", required);
    },
    handleChange: function (cmp, event) {
        // Get the list of the "value" attribute on all the selected options
        var selectedOptionsList = event.getParam("value");
        alert("Options selected: '" + selectedOptionsList + "'");
    }
})