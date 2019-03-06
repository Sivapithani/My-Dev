public class PageBreakswithPDF {

    public List<Account> acclist{get; set;}
    public PageBreakswithPDF(){
          acclist =[select id,name,phone ,rating from Account];
    }
}