public class EsubDocscode {
/* 
<apex:page tabStyle="ocm_Blue_Sky_Record__c" controller="eSubDocsPermissionPageController" title="eSubDocs Permissions Page">    
	<script src="{!URLFOR($Resource.fixhead,'/fixhead/jquery.js')}"></script>
    <script src="{!URLFOR($Resource.fixhead,'/fixhead/jquery.dataTables.js')}"></script>
    <apex:form id="myForm">
        <apex:pageBlock id="crPB" title="eSubDocs Permissions" mode="edit">
            <apex:pageMessages id="msgsSection" />
            <apex:pageBlockSection id="eSubDocsSummary" columns="4">
                <apex:pageblocksectionItem id="OwnedBy">
                   <apex:outputLabel value="Fund/Product" />
                   <apex:selectlist id="FpId" value="{!selectedFP}" size="1">
                       <apex:selectoptions value="{!FundProducts}" />
                       <apex:actionSupport event="onchange" action="{!flesFromFund}" reRender="msgsSection, dtable, orgId"/>
                   </apex:selectlist>
               </apex:pageblocksectionItem>
               <apex:inputField id="ownerId" label="Primary Rep" value="{!bsrRep.Marketing_Rep__c}">
                   <apex:actionSupport event="onchange" action="{!searchByUser}" reRender="msgsSection, FpId, orgId, dtable"/>
               </apex:inputField>
               <apex:pageblocksectionItem id="orgs">
                   <apex:outputLabel value="Organizations" />
                   <apex:selectlist id="orgId" value="{!selectedOrg}" size="1">
                       <apex:selectoptions value="{!Organizations}" />
                       <apex:actionSupport event="onchange" action="{!flesFromFund}" reRender="msgsSection, dtable"/>
                   </apex:selectlist>
               </apex:pageblocksectionItem>
               <apex:commandbutton value="Save" action="{!save}" reRender="msgsSection"  status="GetRecordsStatus"/>
               <!-- <apex:commandbutton value="Search" action="{!searchRec}" reRender="dtable" /> -->
            </apex:pageBlockSection>
            <br/>
            <apex:actionstatus id="GetRecordsStatus">
		       <apex:facet name="start">
		           <div class="waitingSearchDiv" id="el_loading" style="background-color: #fbfbfb; height: 100%;opacity:0.65;width:100%;"> 
		               <div class="waitingHolder" style="top: 335.2px; width: 91px;">
		                   <img class="waitingImage" src="/img/loading.gif" title="Please Wait..." />
		                <span class="waitingDescription">Please wait...</span>
		               </div>
		           </div>
		       </apex:facet>
		    </apex:actionstatus>
            <apex:outputPanel id="dtable">            
            <script>
                    var vph = $(window).height();
                        $('#mytable3A').dataTable( {
                        "bPaginate": false,
                        "sScrollY":  vph-320,
                        "bInfo":     false,
                        "bFilter":   false,
                        "bSort":     false     
                        } ); 
                </script>
                <div class="pbBody">
                    <table cellpadding="0" cellspacing="0" border="0" class="mytables list" id="mytable3A">
                        <thead>
                            <tr class="headerRow">
                                <th>Organization</th>
                                <th>Contact</th>
                                <th>Contact Email</th>
                                <th>Access Type</th>
                                <apex:repeat value="{!fleResults}" var="fleResult">
                                    <th>{!fleResult.Fund_Legal_Entity_Code__c} - {!fleResult.Type_of_OCM_Entity__c}</th>
                                </apex:repeat>
                            </tr>
                        </thead>
                        <tbody>
                            <apex:repeat value="{!results}" var="result">
                                <tr>
                                    <td>
                                        <apex:outputLink value="/{!result.accId}" target="_new" style="color: #015BA7;text-decoration: none;">
                                            <apex:outputText value="{!result.accName}" />
                                        </apex:outputLink>
                                    </td>
                                    <td>
                                        <apex:outputLink value="/{!result.conId}" target="_new" style="color: #015BA7;text-decoration: none;">
                                            <apex:outputText value="{!result.conName}" />
                                        </apex:outputLink>
                                    </td>
                                    <td>
                                        {!result.conEmail}
                                    </td>
                                    <td>
                                        <apex:selectList value="{!result.mlTypeRw}" size="1">
                                            <apex:selectOptions value="{!mlTypePicklist}" />
                                        </apex:selectList>
                                    </td>
                                    <td style="display:{!IF(len(result.fle1)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle1Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle2)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle2Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle3)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle3Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle4)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle4Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle5)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle5Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle6)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle6Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle7)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle7Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle8)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle8Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle9)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle9Disp}"/>
                                    </td>
                                    <td style="display:{!IF(len(result.fle10)==0, 'none', '')}">
                                    	<apex:inputCheckbox value="{!result.fle10Disp}"/>
                                    </td>
                                </tr>
                            </apex:repeat>
                        </tbody>
                    </table>
                </div>
            </apex:outputPanel>         
        </apex:pageBlock>
    </apex:form>
</apex:page>


 
 public with sharing class eSubDocsPermissionPageController 
{
    public ocm_Blue_Sky_Record__c bsrRep {get; set;}
    public string selectedFP {get;set;}  
    public string selectedOrg {get;set;}
    public list<eSubDocstModel> results {get;set;}
    public list<ocm_LegalEntity__c> fleResults {get;set;}
        
     
    public eSubDocsPermissionPageController()
    {
        bsrRep = new ocm_Blue_Sky_Record__c();
        bsrRep.Marketing_Rep__c = Userinfo.getUserId();
        fleResults = new list<ocm_LegalEntity__c>();  
    }
     
    public list<SelectOption> getFundProducts()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        for(ocm_FundFamily__c ff : [Select o.Id, o.Fund_Product_Marketing_Name__c From ocm_FundFamily__c o where (Fund_Product_Marketing_Name__c != null AND (Marketing_Status__c = 'Active' OR Marketing_Status__c = 'Pending')) order by Fund_Product_Marketing_Name__c])
        {
            if(ff.Fund_Product_Marketing_Name__c != null)
                options.add(new SelectOption(ff.Id, ff.Fund_Product_Marketing_Name__c));
        }
        return options;
    }
    
    public void flesFromFund()
    { 
        
        list<ocm_Blue_Sky_Record__c> bsrList = new list<ocm_Blue_Sky_Record__c>();
        
        if(string.isNotEmpty(selectedOrg))
            bsrList = [Select o.Id From ocm_Blue_Sky_Record__c o where (Fund_Product__c = :selectedFP AND Blue_Sky_Status__c = :OCM_Constants.OCM_BLUESKY_STATUS_PPM_SENT AND Marketing_Rep__c =:bsrRep.Marketing_Rep__c AND Organization__c = :selectedOrg)]; 
        
        if(bsrList != null && bsrList.size() > 0)
            fleResults = [Select o.Id, o.Fund_Legal_Entity_Code__c, o.Type_of_OCM_Entity__c From ocm_LegalEntity__c o where (Fund_Family__c = :selectedFP) order by Type_of_OCM_Entity__c asc, Name asc];
        else
            fleResults = new list<ocm_LegalEntity__c>();    
        
        searchRec();         
        getOrganizations();      
    }
    public list<SelectOption> getOrganizations()
    {   
        list<ocm_Blue_Sky_Record__c> bsrList = new list<ocm_Blue_Sky_Record__c>();
        
        if(string.isNotEmpty(selectedFP))
            bsrList = [SELECT Organization__c, Organization__r.name FROM ocm_Blue_Sky_Record__c where (Blue_Sky_Status__c = :OCM_Constants.OCM_BLUESKY_STATUS_PPM_SENT AND Marketing_Rep__c =:bsrRep.Marketing_Rep__c AND Fund_Product__c = :selectedFP) order by Organization__r.name asc]; 
        else
            bsrList = [SELECT Organization__c, Organization__r.name FROM ocm_Blue_Sky_Record__c where (Blue_Sky_Status__c = :OCM_Constants.OCM_BLUESKY_STATUS_PPM_SENT AND Marketing_Rep__c =:bsrRep.Marketing_Rep__c) order by Organization__r.name asc];
        
        
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        set<Id> optionsSet = new set<Id>();
        
        for(ocm_Blue_Sky_Record__c bsr :bsrList)
        {
            if(bsr.Organization__c != null && bsr.Organization__r.Name !=null)
            {
                if(!(optionsSet.isEmpty()))
                {
                    if(!(optionsSet.contains(bsr.Organization__c)))
                    {
                        optionsSet.add(bsr.Organization__c);
                        options.add(new SelectOption(bsr.Organization__c,bsr.Organization__r.Name));
                    }
                }
                else
                {
                    optionsSet.add(bsr.Organization__c);
                    options.add(new SelectOption(bsr.Organization__c,bsr.Organization__r.Name));
                }
            }
        }
        return options;
    } 
    
    public void searchByUser()
    {
        selectedOrg = null;
        fleResults = new list<ocm_LegalEntity__c>();
        getOrganizations();    
    }
    
    public void searchRec() 
    {   
        set<Id> accIdSet = new set<Id>();
        set<string> bsrSet = new set<string>();
        set<string> conSet = new set<string>();
        results = new list<eSubDocstModel>(); 
        
        list<Contact> conList = new list<Contact>();
        
        list<ocm_Blue_Sky_Record__c> bsrList = new list<ocm_Blue_Sky_Record__c>();
        
        if(string.isNotEmpty(selectedOrg) && string.isNotEmpty(selectedFP) && string.isNotEmpty(bsrRep.Marketing_Rep__c))
            bsrList = [Select o.Organization__c, o.Organization__r.Name, o.Id, o.Contact_s_Email__c, o.Contact__c, o.Contact__r.Name, o.Blue_Sky_Status__c From ocm_Blue_Sky_Record__c o where (Blue_Sky_Status__c = :OCM_Constants.OCM_BLUESKY_STATUS_PPM_SENT AND Marketing_Rep__c =:bsrRep.Marketing_Rep__c AND Organization__c = :selectedOrg AND Fund_Product__c = :selectedFP) order by Organization__r.Name asc, Contact__r.Name asc];
        
        for(ocm_Blue_Sky_Record__c bsr: bsrList)
        {
            if(bsr.Organization__c != null)
                accIdSet.add(bsr.Organization__c);
        }
        
        list<Contact> existedConList = new list<Contact>(); 
        String eSubDocsRecId = Schema.SObjectType.ocm_Mailing_List__c.getRecordTypeInfosByDeveloperName().get('eSubDocs').getRecordTypeId();
        
        if (accIdSet != null && accIdSet.size()>0)
        	existedConList = [Select Id, Name, Email, AccountId, Account.Name, (Select Type__c, Fund_Legal_Entities__c From Mailing_Lists__r where (Fund_Product__c = :selectedFP AND RecordTypeId = :eSubDocsRecId) limit 1) from Contact where AccountId = :accIdSet order by Name asc]; 
        
        for(Contact bsr: existedConList)
        {
            string org = bsr.Account.Name;
            eSubDocstModel es1 = new eSubDocstModel();
            if(!(bsrSet.contains(org)))
            {
                bsrSet.add(org);
                es1.accId = bsr.AccountId;
                es1.accName = org;
            }
            es1.conId = bsr.Id;
            es1.conName = bsr.Name;
            es1.conEmail = bsr.Email;
            if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && bsr.Mailing_Lists__r[0].Type__c != null)
            	es1.mlTypeRw = bsr.Mailing_Lists__r[0].Type__c;
            if(fleResults != null)
            {
                if(fleResults.size() > 0)
                {
                    es1.fle1 = fleResults[0].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle1Disp = checkFle(es1.fle1, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 1)
                {
                    es1.fle2 = fleResults[1].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle2Disp = checkFle(es1.fle2, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 2)
                {
                    es1.fle3 = fleResults[2].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle3Disp = checkFle(es1.fle3, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 3)
                {
                    es1.fle4 = fleResults[3].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle4Disp = checkFle(es1.fle4, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 4)
                {
                    es1.fle5 = fleResults[4].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle5Disp = checkFle(es1.fle5, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 5)
                {
                    es1.fle6 = fleResults[5].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle6Disp = checkFle(es1.fle6, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 6)
                {
                    es1.fle7 = fleResults[6].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle7Disp = checkFle(es1.fle7, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 7)
                {
                    es1.fle8 = fleResults[7].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle8Disp = checkFle(es1.fle8, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 8)
                {
                    es1.fle9 = fleResults[8].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle9Disp = checkFle(es1.fle9, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }
                if(fleResults.size() > 9)
                {
                    es1.fle10 = fleResults[9].Fund_Legal_Entity_Code__c;
                    if(bsr.Mailing_Lists__r != null && bsr.Mailing_Lists__r.size() > 0 && string.isNotEmpty(bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c))
                    	es1.fle10Disp = checkFle(es1.fle10, bsr.Mailing_Lists__r[0].Fund_Legal_Entities__c);
                }                    
            }
            results.add(es1);           
        }
    }
    
    private boolean checkFle(String fle, string fleSet)
    {
    	boolean isFind = false;
    	for(string st : fleSet.split('; '))
    	{
    		if(st.equals(fle))
    			isFind = true;
    	}
    	return isFind;
    }
    
    public list<SelectOption> getmlTypePicklist()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        map<String, Schema.SObjectField> field_map = Schema.getGlobalDescribe().get('ocm_Mailing_List__c').getDescribe().fields.getMap();
          
        for(Schema.PicklistEntry a : field_map.get('Type__c').getDescribe().getPickListValues()) 
            options.add(new SelectOption(a.getLabel(),a.getLabel()));
        
        return options;
    }
    
    public void save()
    {   
        if(string.isEmpty(selectedOrg) || string.isEmpty(selectedFP) || string.isEmpty(bsrRep.Marketing_Rep__c))
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, 'Please select Primary Rep, Fund/Product and Organzations to proceed.'));
        else
        {
            set<string> uniquePrimaryCheck = new set<String>();
            for(eSubDocstModel es: results)
            {
                if(es.mlTypeRw != null && es.mlTypeRw.equals('Primary'))
                    uniquePrimaryCheck.add(es.conId);
            }
            if(!(uniquePrimaryCheck.isEmpty()))
            {
                if(uniquePrimaryCheck != null && uniquePrimaryCheck.size() > 1)
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, 'Access Type of "Primary" should not be duplicate'));
                else
                {
                    String eSubDocsRecId = Schema.SObjectType.ocm_Mailing_List__c.getRecordTypeInfosByDeveloperName().get('eSubDocs').getRecordTypeId();  
                    boolean isValid = true;                  
                    set<ocm_Mailing_List__c> mailngList2Update = new set<ocm_Mailing_List__c>();
                    for(eSubDocstModel es: results)
                    {
                        if(es.mlTypeRw != null)
                        {
                        	ocm_Mailing_List__c ml = new ocm_Mailing_List__c();
	                        ml.Contact__c = es.conId;
	                        ml.Fund_Product__c = selectedFP;
	                        ml.RecordTypeId = eSubDocsRecId;
	                        String fle = '';
	                        if(es.fle1Disp == true)
	                        	fle += es.fle1 +'; ';
	                        if(es.fle2Disp == true)
	                        	fle += es.fle2+'; ';
	                        if(es.fle3Disp == true)
	                        	fle += es.fle3+'; ';
	                        if(es.fle4Disp == true)
	                        	fle += es.fle4+'; ';
	                        if(es.fle5Disp == true)
	                        	fle += es.fle5+'; ';
	                        if(es.fle6Disp == true)
	                        	fle += es.fle6+'; ';
	                        if(es.fle7Disp == true)
	                        	fle += es.fle7+'; ';
	                        if(es.fle8Disp == true)
	                        	fle += es.fle8+'; ';
	                        if(es.fle9Disp == true)
	                        	fle += es.fle9+'; ';
	                        if(es.fle10Disp == true)
	                        	fle += es.fle10+'; ';
	                        if(string.isNotEmpty(fle))
	                        	fle = fle.substring(0,fle.length()-2);
	                        ml.Fund_Legal_Entities__c = fle;
	                        ml.Type__c = es.mlTypeRw;	
	                        
	                        mailngList2Update.add(ml);
                        }
                        else
                        {
                        	if(es.fle1Disp == true || es.fle2Disp == true || es.fle3Disp == true || es.fle4Disp == true || es.fle5Disp == true || es.fle6Disp == true || es.fle7Disp == true || es.fle8Disp == true || es.fle9Disp == true || es.fle10Disp == true)
                        	{
                        		ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, 'Please acknowledge Access type of "'+es.conName+'" to proceed!'));
                        		isValid = false;
                        		break;
                        	}
                        }
                    }
                    
                    if(mailngList2Update != null && mailngList2Update.size() >0 && isValid == true)
                    {
                    	set<id> conSet = new set<Id>();
                    	for(ocm_Mailing_List__c ml :mailngList2Update)
	                    	conSet.add(ml.Contact__c);
	                    	
	                    set<ocm_Mailing_List__c> newMLSet = new set<ocm_Mailing_List__c>();
	                    set<ocm_Mailing_List__c> oldMLSet = new set<ocm_Mailing_List__c>();
	                    
	                    map<string, ocm_Mailing_List__c> existedMap= new map<string, ocm_Mailing_List__c>();
	                    for(ocm_Mailing_List__c ml : [Select o.Contact__c, o.Fund_Product__c, o.Id From ocm_Mailing_List__c o where (RecordTypeId = :eSubDocsRecId AND Fund_Product__c = :selectedFP AND Contact__c =:conSet)])	
                    	{
                    		string key = ml.Fund_Product__c+'=>'+ml.Contact__c;
                    		existedMap.put(key, ml);
                    	}
                    	
                    	for(ocm_Mailing_List__c ml :mailngList2Update)
                    	{
                    		string key = ml.Fund_Product__c+'=>'+ml.Contact__c;
                    		
                    		if(existedMap != null && existedMap.get(key) != null)
                    		{
                    			ml.Id = existedMap.get(key).Id;
                    			oldMLSet.add(ml);
                    		}
                    		else
                    			newMLSet.add(ml);
                    		
                    	}
                    	if(newMLSet != null && newMLSet.size() > 0)
                    	{
                    		list<ocm_Mailing_List__c> newMLlist = new list<ocm_Mailing_List__c>();
                    		newMLlist.addAll(newMLSet);
                    		insert newMLlist;
                    	}
                    	if(oldMLSet != null && oldMLSet.size() > 0)
                    	{
                    		list<ocm_Mailing_List__c> oldMLlist = new list<ocm_Mailing_List__c>();
                    		oldMLlist.addAll(oldMLSet);
                    		update oldMLlist;
                    	}
                    }
                }   
            }
            else
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, 'Atleast one "Primary" Access Type is mandatory to proceed!'));
        }
    }
    
    public class eSubDocstModel
    {
        public id accId{get;set;}
        public string accName{get;set;}
        public id conId{get;set;}
        public string conName{get;set;}
        public string conEmail{get;set;}
        public String mlTypeRw{get;set;}
        public String fle1{get;set;}
        public boolean fle1Disp{get;set;}
        public String fle2{get;set;}
        public boolean fle2Disp{get;set;}
        public String fle3{get;set;}
        public boolean fle3Disp{get;set;}
        public String fle4{get;set;}
        public boolean fle4Disp{get;set;}
        public String fle5{get;set;}
        public boolean fle5Disp{get;set;}
        public String fle6{get;set;}
        public boolean fle6Disp{get;set;}
        public String fle7{get;set;}
        public boolean fle7Disp{get;set;}
        public String fle8{get;set;}
        public boolean fle8Disp{get;set;}
        public String fle9{get;set;}
        public boolean fle9Disp{get;set;}
        public String fle10{get;set;}
        public boolean fle10Disp{get;set;}
    }
}

  @IsTest
public class eSubDocsPermissionPageControllerTest {
    @testSetup static void testDataSetup(){
         User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
         RecordType rtypeClient = [select id from RecordType where Name =: OCM_Constants.OCM_CLIENT limit 1];
         System.runAs(usr){
            
            Account a = UnitTestFactory.buildTestAccount();
            a.RecordTypeId = rtypeClient.Id;
            a.Name = OCM_Constants.TEST_ACCOUNT;
            a.Primary_Marketing_Representative__c = UserInfo.getUserId();
                  
            AccountTriggerHandler.hasAlreadyRanAfterInsert = true;
            AccountTriggerHandler.hasAlreadyRanAfterUpdate = true;
            AccountTriggerHandler.hasAlreadyRanBeforeUpdate = true;
            insert a;
            AccountTriggerHandler.hasAlreadyRanAfterInsert = false;
            AccountTriggerHandler.hasAlreadyRanAfterUpdate = false;
            AccountTriggerHandler.hasAlreadyRanBeforeUpdate = false;
            
            list<Contact> conList = new list<Contact>();
            conList.add(new Contact(FirstName='Test', LastName='Test', AccountId=a.Id,Email ='Testcon@email.com'));
            conList.add(new Contact(FirstName='Test1', LastName='Test1', AccountId=a.Id, Email ='Testcon1@email.com'));
            conList.add(new Contact(FirstName='Test2', LastName='Test2', AccountId=a.Id,Email ='Testcon2@email.com'));
            conList.add(new Contact(FirstName='Test3', LastName='Test3', AccountId=a.Id, Email ='Testcon3@email.com'));
            ContactTriggerHandler.hasAlreadyRanBeforeInsert = true;
            ContactTriggerHandler.hasAlreadyRanAfterInsert = true;
            ContactTriggerHandler.hasAlreadyRanAfterUpdate = true;
            insert conList;
            ContactTriggerHandler.hasAlreadyRanBeforeInsert = false;
            ContactTriggerHandler.hasAlreadyRanAfterInsert = false;
            ContactTriggerHandler.hasAlreadyRanAfterUpdate = false;
            
            list<ocm_Strategy__c> stratList = new list<ocm_Strategy__c>();        
            ocm_Strategy__c testStrategyDD1 = UnitTestFactory.buildTestStrategy();
            testStrategyDD1.Name  = 'Fund of Fund';
            stratList.add(testStrategyDD1);
            
            ocm_Strategy__c testStrategyDD2 = UnitTestFactory.buildTestStrategy();
            testStrategyDD2.Name  = 'Fund of Fund1';
            stratList.add(testStrategyDD2);
            insert stratList; 
            
            list<ocm_FundFamily__c> fundList = new list<ocm_FundFamily__c>();
            for(integer i=1; i<=10; i++)
            {
                ocm_FundFamily__c ff = UnitTestFactory.buildTestFundFamily();
                ff.Name = 'Test Fund Family'+i;
                ff.Fund_Product_Marketing_Name__c  = 'TFF'+i;
                ff.Marketing_Status__c = OCM_Constants.OCM_STATUS_ACTIVE;
              
                fundList.add(ff);
            }
            FundFamilyTriggerHandler.isAfterFired = true;       
            insert fundList;
            FundFamilyTriggerHandler.isAfterFired = false;
            
            RecordType rtypeLegalEntity = [select id from RecordType where Name =: OCM_Constants.RT_FUND_LEGAL_ENTITY limit 1];
            
            list<ocm_LegalEntity__c> flelist = new list<ocm_LegalEntity__c>();
            
            for(Integer iLegalEntity = 0; iLegalEntity < 10; iLegalEntity++)
            {           
                ocm_LegalEntity__c le = UnitTestFactory.buildTestLegalEntity();
                le.Fund_Legal_Entity_Code__c = '1234' + iLegalEntity;
                le.Name = OCM_Constants.TEST_LEGAL_ACCOUNT + iLegalEntity;
                le.Client__c = a.Id;
                le.Fund_Family__c = fundList[0].id;
                le.RecordTypeId = rtypeLegalEntity.Id;
                le.CIE_ID_EXT__c = 'CIEEX'+iLegalEntity;
                le.Type_of_OCM_Entity__c ='Master';
                flelist.add(le);
            }
            LegalEntityTriggerHandler.isFirstCall = true;
            LegalEntityTriggerHandler.isFirstCallAfterUpdate = true;            
            LegalEntityTriggerHandler.hasAlreadyRanAfterInsert = true;
            LegalEntityTriggerHandler.hasAlreadyRanAfterUpdate = true;
            LegalEntityTriggerHandler.hasAlreadyRanAfterDelete = true;          
            insert flelist;
            LegalEntityTriggerHandler.isFirstCall = false;
            LegalEntityTriggerHandler.isFirstCallAfterUpdate = false;           
            LegalEntityTriggerHandler.hasAlreadyRanAfterInsert = false;
            LegalEntityTriggerHandler.hasAlreadyRanAfterUpdate = false;
            LegalEntityTriggerHandler.hasAlreadyRanAfterDelete = false; 
               
           ocm_Fund_Close__c fundClose = new ocm_Fund_Close__c(Close_Date__c = System.today(), Fund_Family__c = fundList[0].Id, Fund_Close_Name__c = '01');
           insert fundClose;
            
            ocm_Marketing_Entity__c me = new ocm_Marketing_Entity__c(Name = 'Test');
            insert me;
            list<ocm_FundFamily__c> resultFundList = [Select Id, Name From ocm_FundFamily__c Where Name = 'Test Fund Family1' AND Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
            
            list<ocm_Blue_Sky_Record__c> blueSkyList = new list<ocm_Blue_Sky_Record__c>();
            blueSkyList.add(new ocm_Blue_Sky_Record__c (Name = 'Test', Blue_Sky_Status__c = 'PPM Sent', 
            Contact__c = conList[0].Id, Fund_Product__c = resultFundList[0].Id, Fund_Close__c = fundClose.Id, Marketing_Rep__c = UserInfo.getUserId(), 
            Organization__c = a.Id, Strategy__c = testStrategyDD1.id, Marketing_Entity__c = me.Id));
            
            blueSkyList.add(new ocm_Blue_Sky_Record__c (Name = 'Test', Blue_Sky_Status__c = 'PPM Sent', 
            Contact__c = conList[1].Id, Fund_Product__c = resultFundList[0].Id, Fund_Close__c = fundClose.Id, Marketing_Rep__c = UserInfo.getUserId(), 
            Organization__c = a.Id, Strategy__c = testStrategyDD1.id, Marketing_Entity__c = me.Id));
            insert blueSkyList;
            
            String eSubDocsRecId = Schema.SObjectType.ocm_Mailing_List__c.getRecordTypeInfosByDeveloperName().get('eSubDocs').getRecordTypeId();
           list<ocm_Mailing_List__c> ocmMlList =new list<ocm_Mailing_List__c>();
            ocm_Mailing_List__c ml =new ocm_Mailing_List__c();
            ml.Contact__c = conList[0].Id;
            ml.Fund_Product__c =resultFundList[0].Id;
            ml.RecordTypeId = eSubDocsRecId;
            ml.Fund_Legal_Entities__c =flelist[0].Fund_Legal_Entity_Code__c;
            ml.Type__c ='Primary';
            ocmMlList.add(ml);
            
            insert ocmMlList;
         }
    }
    static testMethod void eSubDocsPermissionPageControllerConstructorTest() 
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        test.startTest();
        System.runAs(usr){
            try
            {
                eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
                esub.save();
                esub.searchByUser();  
            }
            catch (Exception ex)
            {
                System.Assert(ex.getMessage().contains('Please select Primary Rep, Fund/Product and Organzations to proceed.'));   
            }
        }
        test.stopTest();
    }
    static testmethod void fundproductfilterTest()
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        list<ocm_FundFamily__c> fundList = [Select Id, Name From ocm_FundFamily__c Where Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
        test.startTest();
        eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
        esub.selectedFP = fundList[0].Id;
        esub.bsrRep.Marketing_Rep__c = usr.id;
        esub.getFundProducts();
        esub.flesFromFund(); 
        esub.getmlTypePicklist();
        system.assertEquals(0, esub.results.size());
        test.stoptest();
    } 
    static testmethod void orgnizationfilterTest()
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        list<ocm_FundFamily__c> fundList = [Select Id, Name From ocm_FundFamily__c Where Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
        Account a = [Select Id, Name From Account Where Name =: OCM_Constants.TEST_ACCOUNT Limit 1];
        test.startTest();
        eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
        esub.bsrRep.Marketing_Rep__c = usr.id;
        esub.getOrganizations();
        esub.selectedOrg = a.Id;
        esub.selectedFP = fundList[0].Id;
        esub.flesFromFund();
        
        system.assertEquals(4, esub.results.size());
        test.stoptest();
    }
    static testmethod void saveMethodTest()
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        list<ocm_FundFamily__c> fundList = [Select Id, Name From ocm_FundFamily__c Where Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
        Account a = [Select Id, Name From Account Where Name =: OCM_Constants.TEST_ACCOUNT Limit 1];
        list<ocm_Mailing_List__c> ml =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(1, ml.size());
        test.startTest();
        eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
        esub.bsrRep.Marketing_Rep__c = usr.id;
        esub.selectedOrg = a.Id;
        esub.selectedFP = fundList[0].Id;
        esub.flesFromFund();
        esub.results[0].fle2Disp =true;
        esub.results[0].fle3Disp =true;
        esub.results[0].fle4Disp =true;
        esub.results[0].fle5Disp =true;
        esub.results[0].fle6Disp =true;
        esub.results[0].fle7Disp =true;
        esub.results[0].fle8Disp =true;
        esub.results[0].fle9Disp =true;
        esub.results[0].fle10Disp =true;
        esub.results[1].mlTypeRw ='Junior';
        esub.save();
        list<ocm_Mailing_List__c> mlresult =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(2, mlresult.size());
        test.stoptest();
    }
    static testmethod void uniquePrimaryduplicateCheckTest()
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        list<ocm_FundFamily__c> fundList = [Select Id, Name From ocm_FundFamily__c Where Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
        Account a = [Select Id, Name From Account Where Name =: OCM_Constants.TEST_ACCOUNT Limit 1];
        list<ocm_Mailing_List__c> ml =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(1, ml.size());
        test.startTest();
        try
        {
            eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
            esub.bsrRep.Marketing_Rep__c = usr.id;
            esub.selectedOrg = a.Id;
            esub.selectedFP = fundList[0].Id;
            esub.flesFromFund();
            esub.results[1].mlTypeRw ='Primary';
            esub.save();  
        }
        catch (Exception ex)
        {
             System.Assert(ex.getMessage().contains('Access Type of "Primary" should not be duplicate'));
        }
        list<ocm_Mailing_List__c> mlResult =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(1, mlResult.size());
        test.stoptest();
    }
   
    static testmethod void accessTypeCheckTest()
    {
        User usr = [Select Id, Name, OCM_Marketing_Rep__c From User Where OCM_Marketing_Rep__c = true and IsActive =true Limit 1];
        list<ocm_FundFamily__c> fundList = [Select Id, Name From ocm_FundFamily__c Where Marketing_Status__c =: OCM_Constants.OCM_STATUS_ACTIVE];
        Account a = [Select Id, Name From Account Where Name =: OCM_Constants.TEST_ACCOUNT Limit 1];
        list<ocm_Mailing_List__c> ml =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(1, ml.size());
        test.startTest();
        try
        {
            eSubDocsPermissionPageController esub = new eSubDocsPermissionPageController();
            esub.bsrRep.Marketing_Rep__c = usr.id;
            esub.selectedOrg = a.Id;
            esub.selectedFP = fundList[0].Id;
            esub.flesFromFund();
            esub.results[1].fle1Disp =true;
            esub.save();  
        }
        catch (Exception ex)
        {
             System.Assert(ex.getMessage().contains('Please acknowledge Access type of '));
        }
        list<ocm_Mailing_List__c> mlResult =[select id,Fund_Product__c from ocm_Mailing_List__c where Fund_Product__c =:fundList[0].id];
        system.assertEquals(1, mlResult.size());
        test.stoptest();
    }
    

  */
}