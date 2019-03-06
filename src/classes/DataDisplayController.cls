public class DataDisplayController {
	public String PDFData {get; set;} 
    public list<jsonvalue> jsonstring {get; set;} 
    public DataDisplayController(){
        PDFData = '';
     
    }
    
    public PageReference downloadPDF(){
       // jsonstring = (List<jsonvalue>) System.JSON.deserialize(PDFData , List<jsonvalue>.class);
        System.PageReference pageRef = new System.PageReference('/apex/PDFGenerator');
    
        //ensure pdf downloads and is assigned with defined name
        pageRef.getHeaders().put('content-disposition', 'attachment; filename=TestPDF.pdf');
     
        return pageRef;
    }
    public class jsonvalue{
 
                public String name{get;set;}
                public String mobile{get;set;}
              public String email{get;set;}
              
    }
}