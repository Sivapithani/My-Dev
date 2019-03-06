public class callChatAgent {

    public String firstname{get;set;}
    public String lastname{get;set;}
    public String email{get;set;}
    
    
    public PageReference redirectChatpage(){
    
        System.debug( 'firstname===> ' +firstname  );
         System.debug( 'firstname===> ' +lastname  );
        System.debug( 'firstname===> ' +email  );
        PageReference  page = new PageReference('/apex/redirectToChat');
        page.setRedirect(false);
        
        return page;
    
    }

}