({
   doInit : function(component, event, helper) {       
      helper.getcontacts(component);
       alert('in init');
   },
   /* redirectToSobject:function(component, event, helper) {
        var selectedItem = event.currentTarget;
        var IdP = selectedItem.dataset.record;
        
        if ((typeof sforce != 'undefined') && sforce && (!!sforce.one))
            sforce.one.navigateToSObject(IdP);
        else{
            location.href = '/' + IdP;
      }
  
    } ,
     afterScriptsLoaded : function(component, event, helper) {
        var doc = new jsPDF();
        console.log('Scripts Loaded');
    }, 
    OnGeneratePdf : function(component, event, helper) {
        
        var quotes = document.getElementById('Table_Id');
        console.log('Hi inside'+quotes);
        html2canvas(quotes, {
            onrendered: function(canvas) {
                console.log('Scripts Loaded');  
                //! MAKE YOUR PDF
                //var pdf = new jsPDF('p', 'pt', 'letter');
                var pdf = new jsPDF('l','pt', 'letter');
                console.log('clientHeight'+quotes.clientHeight); 
                for (var i = 0; i <= quotes.clientHeight/980; i++) {
                    //! This is all just html2canvas stuff
                    var srcImg  = canvas;
                    var sX      = 0;
                    var sY      = 980*i; // start 980 pixels down for every new page
                    var sWidth  = 1000;
                    var sHeight = 980;
                    var dX      = 0;
                    var dY      = 0;
                    var dWidth  = 900;
                    var dHeight = 980;//
                    console.log('inside canvas');
                    window.onePageCanvas = document.createElement("canvas");
                    onePageCanvas.setAttribute('width', 900);
                    onePageCanvas.setAttribute('height', 200);//980
                    var ctx = onePageCanvas.getContext('2d');
                    // details on this usage of this function: 
                    ctx.drawImage(srcImg,sX,sY,sWidth,sHeight,dX,dY,dWidth,dHeight);
                    
                    // document.body.appendChild(canvas);
                    var canvasDataURL = onePageCanvas.toDataURL("image/jpeg", 1.0);
                    var width         = onePageCanvas.width;
                    var height        = onePageCanvas.clientHeight;
                    
                    //! If we're on anything other than the first page,
                    // add another page
                    if (i > 0) {
                        pdf.addPage(612, 791); //8.5" x 11" in pts (in*72) 612 791
                    }
                    //! now we declare that we're working on that page
                    pdf.setPage(i+1);
                   //console.log('before addImage'+canvasDataURL);
                    //! now we add content to that page!
                    pdf.addImage(canvasDataURL, 'JPEG', 20, 40, (width*.62), (height*.62));
                    
                }
                //! after the for loop is finished running, we save the pdf.
                pdf.save('datatable.pdf'); 
                
            }
        }); 
        
    },*/
    downloadDocument :function (component,helper,event){
       //alert('Hi');
       var Datasendproc =component.get("v.sendData");
        alert('Datasendproc'+Datasendproc);
        var  condata =component.get("v.contacts");
       var datasent ={"label":"testdata" };
        //alert('Hi2');
        Datasendproc(datasent ,function(){ });
    },
})