
  <apex:page id="thePage" controller="callChatAgent" showHeader="false" doctype="html-5.0">

    <script>
        function passparam(data){
            //alert( data );
            refreshForm();
            //redirectForm(data);
        }
    </script>
    <apex:form id="theFm">
    
    <apex:actionFunction name="refreshForm" reRender="">
        
    </apex:actionFunction>
    
    <apex:actionFunction name="redirectForm" action="{!redirectChatpage}">
        <apex:param name="firstParam" value=""/>
    </apex:actionFunction>
    

    
    
    
    First Name: <input type='text' id='firstName' value="{!firstname}"/> <br/><br/>
    Last Name: <input type='text' id='lastName' value="{!lastname}" /><br/><br/>
    Email: <input type='text' id='email' value="{!email}"/><br/> <br/>
    
    <!--input type="button" value="Send" onclick="passparam( {!firstname} );"/-->
    
<!------------------------------Live Agent Chat Button Script - Starts-------------------------------------------->
 
       


              
</apex:form>

<!----------------------------------------Live Agent Chat Button Script - Ends----------------------------------------------->

<!----------------------------------------Live Agent Deployment Script - Starts---------------------------------------------->

    <div id="" style="display:block;">
    
        <a id="liveagent_button_online_57336000000PaIk" href="javascript://Chat" style="display:Block;" onclick="liveagent.startChat('57336000000PaIk')"> Chat with experts </a>
        <div id="liveagent_button_offline_57336000000PaIk" style="display: none;"> Agent offline  </div>
    
          
        <script type="text/javascript">
            window.name = 'Start Chat';     
            
            if (!window._laq) { window._laq = []; }
            window._laq.push(function(){liveagent.showWhenOnline('57336000000PaIk', document.getElementById('liveagent_button_online_57336000000PaIk'));
            liveagent.showWhenOffline('57336000000PaIk', document.getElementById('liveagent_button_offline_57336000000PaIk'));
            });
                
                
        </script>
        
        
      <script type='text/javascript' src='https://c.la1-c1-ph2.salesforceliveagent.com/content/g/js/44.0/deployment.js'></script>    
      <script type='text/javascript'>
      
          
          
          
          
        var fname = '{!firstname}';
        var lname = '{!lastname}';
        var email = '{!email}';
    
        liveagent.addCustomDetail("FirstName", 'Keerthi' );
        liveagent.addCustomDetail("LastName", 'Gaddam');
        liveagent.addCustomDetail("Email", 'j.davis@expresst.com');
        
        liveagent.findOrCreate("Contact").map("FirstName", "FirstName", false, false, true)
                                    .map("LastName", "LastName", false, false, true)
                                    .map("Email", "Email", false, false, true)
                                    .saveToTranscript("ContactId").showOnCreate();
    
        
        liveagent.init('https://d.la1-c1-ph2.salesforceliveagent.com/chat', '57236000000PZ6T', '00D36000000ttM4');
    
        

    </script>
        
        
    </div>

    
    
<!-------------------------------------------------Live Agent Deployment Script - Ends------------------------------------>
</apex:page>

public class callChatAgent {

    public String firstname{get;set;}
    public String lastname{get;set;}
    public String email{get;set;}
    
    
    public PageReference redirectChatpage(){
    
        System.debug( 'firstname===> ' + apexpages.currentpage().getparameters().get('firstParam') );
        PageReference  page = new PageReference('/apex/redirectToChat');
        page.setRedirect(false);
        
        return page;
    
    }

}


