({
    showButtons : function(cmp, auth) {  
        var allButtons = [
            { label: "Male Drug Court", key: "MDC" },
            { label: "Female Drug Court", key: "FDC" },
            { label: "Male DUI Court", key: "MDUI" },
            { label: "Female DUI Court", key: "FDUI" },
            { label: "Co-Occurring", key: "CO" },
            { label: "VTC", key: "VTC" },
            { label: "MHC", key: "MHC" }
        ];

        cmp.set('v.buttons', allButtons);
    },

    showToast : function(title, message, type) {
        var key;
        switch (type) {
        case 'success':
            key = 'like'; break;
        case 'error' :
            key = 'ban'; break;
        case 'info':
        default:
            key = 'info'; break;
        }
        var toast = $A.get('e.force:showToast');
        toast.setParams({
            'title': title,
            'message' : message,
            'key' : key,
            'type' : type
        });
        toast.fire();
    }
})