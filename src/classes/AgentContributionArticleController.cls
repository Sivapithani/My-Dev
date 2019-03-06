public class AgentContributionArticleController {
    // The constructor must take a ApexPages.KnowledgeArticleVersionStandardControlleras an argument
        public AgentContributionArticleController(ApexPages.KnowledgeArticleVersionStandardController
                                           ctl)
             {
                  SObject article = ctl.getRecord(); //this is the SObject for the new article.
                  //It can optionally be cast to the properarticle type, e.g. 
                 // FAQ__kav properarticle = (FAQ__kav) ctl.getRecord();
                  String sourceId = ctl.getSourceId(); 
                  //this returns the id of the case that wasclosed.
                  Case c = [select subject, description from Case where id=:sourceId];
                  article.put('title', 'From Case: '+c.subject);
                 //this overrides the defaultbehavior of pre-filling the title of the article with the subject of the closed case.
                 article.put('Details__c',c.description);
                 ctl.selectDataCategory('Geography','USA'); //Only one category per categorygroup can be specified.
                 ctl.selectDataCategory('Topics','Maintenance');
             }
}