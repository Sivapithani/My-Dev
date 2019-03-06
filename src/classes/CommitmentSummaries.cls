public class CommitmentSummaries {
/* 
<apex:page id="commitmentSummaries" standardController="Opportunity" extensions="CommitmentSummariesController">
    <!-- Resources for jquery for fixed header 
    <script src="{!URLFOR($Resource.fixhead,'/fixhead/jquery.js')}"></script>
    <script src="{!URLFOR($Resource.fixhead,'/fixhead/jquery.dataTables.js')}"></script>
    -->
    <script src="{!URLFOR($Resource.HeaderScoller,'jquery-1.11.3.min.js')}"></script>
    <script src="{!URLFOR($Resource.HeaderScoller,'jquery.dataTables.min.js')}"></script>
    <script src="{!URLFOR($Resource.HeaderScoller,'dataTables.fixedColumns.min.js')}"></script>
    <apex:stylesheet value="{!URLFOR($Resource.HeaderScoller,'jquery.dataTables.min.css')}"/>
    <apex:stylesheet value="{!URLFOR($Resource.HeaderScoller,'fixedColumns.dataTables.min.css')}"/> 
    <apex:stylesheet value="{!URLFOR($Resource.HeaderScoller,'GamePlanPage.css')}"/>
    <style>
        .custPopup{
            background-color: white;
            border-width: 2px;
            border-style: solid;
            z-index: 9999;
            left: 50%;
            padding:10px;
            position: absolute;            
            width: 750px;
            margin-left: -250px;
            top:50px;
            height: 500px; 
            overflow: auto;
        }
        .popupBackground{
            background-color:black;
            opacity: 0.20;
            filter: alpha(opacity = 20);
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 9998;
        }
    </style>
    <script type="text/javascript">    
        function updateFilter() 
        {
            filter();
        }

        function decimalCheck(myData) 
        { 
           // var restrictionType = /^\s*-?[0-9]\d*(\.\d{2})?\s*$/;
              var restrictionType = /^\s*-?\d*(\.\d{2,3})?\s*$/;
            if(myData !=='')
            {  
                if(myData.length <= 7)
                {  
                    if((restrictionType.test(myData)) && ((myData*100) != 0))
                    {
                       
                    }
                    else
                    {
                        alert('Please enter proper decimal Amount to proceed(eg. 1234.50)!');
                    }
                }
                else
                {
                    alert('Please enter Amount in millions!');
                }
            }           
            return;   
        }

        /*
        function stageReasonRefresh(stageVal)
        {
            var stageVal = document.getElementById(stageVal).value;
            if(stageVal == "X-Lost")
            {
                document.getElementById("lostReason").disabled = false;
            }
        }
        // need to close
    </script>    
    <apex:form id="myForm">
        <apex:outputPanel id="tstpopup">
            <apex:outputPanel styleClass="popupBackground" layout="block" rendered="{!displayPopUp}"/>
            <apex:outputPanel styleClass="custPopup" layout="block" rendered="{!displayPopUp}">
                <apex:pageMessages id="popUpMsgsSection"/>
                <apex:pageBlock >
                    <apex:pageBlockSection id="commitmentPBS" columns="1">
                        <apex:outputPanel >
                            <apex:commandButton value="Save" action="{!saveChildRec}" rerender="tstpopup, popUpMsgsSection, dtable"/> &nbsp;&nbsp;&nbsp;&nbsp;
                            <apex:commandButton value="Cancel" action="{!closePopup}" rerender="tstpopup"/><br/>
                        </apex:outputPanel>
                        <apex:pageBlockTable id="commitmentSummTable" value="{!addOpportunity}" var="cs">
                            <apex:column headerValue="Organization">
                                <apex:inputField value="{!childAccount.AccountId}"/>
                            </apex:column>
                            <apex:column headerValue="Fund Close">
                                <apex:selectList value="{!cs.fundClose}" size="1">
                                    <apex:selectOptions value="{!RetFundCloses}"/>
                                </apex:selectList>
                            </apex:column>                            
                            <apex:column headerValue="Direct Investment">                                  
                                <apex:inputText value="{!cs.amount}" styleClass="resizedTextbox"/>
                            </apex:column>
                            <apex:column headerValue="Currency">
                                <apex:outputText value="{!cs.currencyVal}" rendered="{!cs.currencyVal != null}"/>
                                <!-- <apex:inputText value="{!cs.currencyVal}" rendered="{!cs.currencyVal == null}" styleClass="resizedTextbox"/> -->
                                <apex:selectList value="{!cs.currencyVal}" size="1" rendered="{!cs.currencyVal == null}" >
                                    <apex:selectOptions value="{!CurrenyList}"/>
                                </apex:selectList>
                            </apex:column>
                            <apex:column headerValue="Stage">
                                <apex:selectList value="{!cs.stage}" size="1">
                                    <apex:selectOptions value="{!StageNames}"/>
                                </apex:selectList>
                            </apex:column>
                            <apex:column headerValue="Comments">
                                <apex:inputTextarea value="{!cs.comments}"/>
                            </apex:column>
                        </apex:pageBlockTable>            
                    </apex:pageBlockSection>                  
                </apex:pageBlock>        
            </apex:outputPanel>      
        </apex:outputPanel>
        <apex:outputPanel id="tstpopup2">
            <apex:outputPanel styleClass="popupBackground" layout="block" rendered="{!displayPopUp}"/>
            <apex:outputPanel styleClass="custPopup" layout="block" rendered="{!displayPopUp}">
                <apex:pageMessages id="popUpMsgsSection2"/>
                <apex:pageBlock >
                    <apex:pageBlockSection id="commitmentPBS2" columns="1">
                        <apex:outputPanel >
                            <apex:commandButton value="Save" action="{!cloneOpp}" rerender="tstpopup2, popUpMsgsSection2, dtable"/> &nbsp;&nbsp;&nbsp;&nbsp;
                            <apex:commandButton value="Cancel" action="{!closePopup}" rerender="tstpopup2"/><br/>
                        </apex:outputPanel>
                        <apex:pageBlockTable id="commitmentSummTable2" value="{!cloneOpportunity}" var="cs">
                            <apex:column headerValue="Organization">
                                <apex:outputText value="{!cs.orgName}"/>
                            </apex:column>
                            <apex:column headerValue="Fund Close">
                                <apex:selectList value="{!cs.fundClose}" size="1">
                                    <apex:selectOptions value="{!RetFundCloses}"/>
                                </apex:selectList>
                            </apex:column>                            
                            <apex:column headerValue="Direct Investment">                                  
                                <apex:inputText value="{!cs.amount}" styleClass="resizedTextbox"/>
                            </apex:column>
                            <apex:column headerValue="Currency">
                                <apex:outputText value="{!cs.currencyVal}" rendered="{!cs.currencyVal != null}"/>
                                <!-- <apex:inputText value="{!cs.currencyVal}" rendered="{!cs.currencyVal == null}" styleClass="resizedTextbox"/> -->
                                <apex:selectList value="{!cs.currencyVal}" size="1" rendered="{!cs.currencyVal == null}" >
                                    <apex:selectOptions value="{!CurrenyList}"/>
                                </apex:selectList>
                            </apex:column>
                            <apex:column headerValue="Stage">
                                <apex:selectList value="{!cs.stage}" size="1">
                                    <apex:selectOptions value="{!StageNames}"/>
                                </apex:selectList>
                            </apex:column>
                            <apex:column headerValue="Comments">
                                <apex:inputTextarea value="{!cs.comments}"/>
                            </apex:column>
                        </apex:pageBlockTable>            
                    </apex:pageBlockSection>                  
                </apex:pageBlock>        
            </apex:outputPanel>      
        </apex:outputPanel>
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
        <apex:pageBlock title="Commitment Summaries" id="commSummPB1">        
        <apex:pageMessages id="msgsSection"/>
            <apex:outputPanel >
                <table width="100%">
                    <tr>
                        <td style="width:30%;">
                            <apex:outputLabel style="font-size: .9em; font-weight: bold;" value="Fund/Product  " />
                            <apex:selectList value="{!selectedFP}" size="1" onchange="updateFilter();" >
                                <apex:selectOptions value="{!FundProducts}"/>
                            </apex:selectList>                            
                        </td>
                        <td style="width:15%">
                            <apex:outputLabel style="font-size: .9em; font-weight: bold;" value="Consultants Only  " />
                            <apex:inputCheckbox id="consultantCB" value="{!consultantsFlag}" onChange="updateFilter();" disabled="{!selectedFP == ''}" />
                        </td>  
                        <td style="width:25%">
                            <apex:outputLabel style="font-size: .9em; font-weight: bold;" value="Marketing Rep  " /> 
                            <apex:inputfield value="{!bsr.Marketing_Rep__c}" onChange="updateFilter();" style="width: 120px; height: 15px"/>
                        </td>                         
                        <td style="width:10%">
                            <apex:commandButton value="Save" action="{!save}" reRender="msgsSection,dtable" status="GetRecordsStatus"/>
                        </td>
                        <td style="width:10%">
                            <apex:outputLink id="commRep" value="/{!commSumRepId}?pv0={!selectedFPName}" target="_new" style="color: #015BA7;text-decoration: none;">
                                <apex:outputText value="Summary Report" />
                            </apex:outputLink>
                        </td>
                    </tr>
                </table>
            </apex:outputPanel>
            <apex:outputPanel id="dtable">
                <div id="col">
                    <!-- Script for fixed header -->
                    <script type="text/javascript" charset="utf-8">
                        $(document).ready(function() 
                        {
                        var vph = $(window).height();
                        var vpw = $(window).width();
                        var table = $('#fixHead').DataTable( {
                            scrollY:        vph-400,
                            scrollX:        true,
                            scrollCollapse: false,
                            paging:         false,
                            "ordering":     false,
                            fixedColumns:   {
                                leftColumns: 1,
                                rightColumns: 0
                            }
                        } );
                        $(".dataTables_wrapper").width(vpw - 95);
                    } );
                    
                   $(window).resize(function() {
                        var vph = $(window).height();
                        var vpw = $(window).width();
                        var table = $('#fixHead').DataTable( {
                            destroy:        true,
                            scrollY:        vph-400,
                            scrollX:        true,
                            scrollCollapse: false,
                            paging:         false,                            
                            "ordering":     false,
                            fixedColumns:   {
                                leftColumns: 1,
                                rightColumns: 0
                            }
                        } );
                        $(".dataTables_wrapper").width(vpw - 95);                    
                    } );
                    </script>
                    <div class="pbBody">
                        <table cellpadding="0" cellspacing="0" border="0" class="mytables list" id="fixHead">
                            <thead>
                                <tr class="headerRow">
                                    <th Class="investorHeaderSize">
                                        <apex:commandLink action="{!sortData}" value="Organization" rerender="dtable">
                                            <apex:param name="sortBy" value="org" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" value="Fund Close" rerender="dtable">
                                            <apex:param name="sortBy" value="fundClose" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:outputText >Clone<br/>Fund Close</apex:outputText>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" rerender="dtable">Direct<br/>Investment
                                            <apex:param name="sortBy" value="amount" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" value="Currency" rerender="dtable">
                                            <apex:param name="sortBy" value="currency" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" value="Stage" rerender="dtable">
                                            <apex:param name="sortBy" value="stage" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" value="Lost Reason" rerender="dtable">
                                            <apex:param name="sortBy" value="lostReason" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:outputText value="ERISA"/>
                                    </th>
                                    <th>
                                        <apex:outputText value="Comments"/>
                                    </th>
                                    <th>                                        
                                        <apex:commandLink action="{!sortData}" rerender="dtable">Last Modified<br/>Date
                                            <apex:param name="sortBy" value="lastModDate" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:outputText value="Consultant"/>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" rerender="dtable">Consultant<br/>Projection 
                                            <apex:param name="sortBy" value="consAmount" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:outputText value="Consultant Status"/>
                                    </th>
                                    <th>
                                        <apex:commandLink action="{!sortData}" rerender="dtable" value="Client Commitments">
                                            <apex:param name="sortBy" value="actRaised" />
                                        </apex:commandLink>
                                    </th>
                                    <th>
                                        <apex:outputText >Add<br/>New Client</apex:outputText>
                                    </th>                                       
                                </tr>
                            </thead>
                            <tbody>
                                <apex:variable value="{!1}" var="rowNum"/>  
                                <apex:repeat value="{!results}" var="result">
                                    <tr>
                                        <td>
                                            <apex:outputLink value="/{!result.orgId}" target="_parent" style="color: #015BA7;text-decoration: none;"><apex:outputText value="{!result.orgName}" /></apex:outputLink>
                                        </td>
                                        <td>
                                            <apex:selectList value="{!result.fundCloseName}" size="1">
                                                <apex:selectOptions value="{!result.oppFundCloseList}"/>
                                            </apex:selectList>
                                        </td> 
                                        <td>
                                            <div align="center">
                                                <apex:commandButton value="+Close" action="{!addRec}" reRender="tstpopup2">
                                                    <apex:param name="orgId" value="{!result.orgId}" assignTo="{!cloneOpportunity.orgId}" />
                                                    <apex:param name="orgName" value="{!result.orgName}" assignTo="{!cloneOpportunity.orgName}" />
                                                    <apex:param name="stage" value="{!result.stage}" assignTo="{!cloneOpportunity.stage}" />                                                    
                                                    <apex:param name="currencyVal" value="{!result.currencyVal}" assignTo="{!cloneOpportunity.currencyVal}" />
                                                    <apex:param name="comments" value="{!result.comments}" assignTo="{!cloneOpportunity.comments}" />                                                    
                                                    <apex:param name="fundProduct" value="{!result.fundProduct}" assignTo="{!cloneOpportunity.fundProduct}" />
                                                    <apex:param name="fundProductName" value="{!result.fundProductName}" assignTo="{!cloneOpportunity.fundProductName}" />
                                                    <apex:param name="fundClose" value="{!result.fundCloseName}" assignTo="{!cloneOpportunity.fundClose}" />
                                                    <apex:param name="amount" value="{!result.amount}" assignTo="{!cloneOpportunity.amount}" />
                                                    <apex:param name="consultant" value="{!result.selectedConsultantId}" assignTo="{!cloneOpportunity.selectedConsultantId}" />
                                                    <apex:param name="parentOpp" value="{!result.parentOpp}" assignTo="{!cloneOpportunity.parentOpp}" />
                                                    <apex:param name="erisa" value="{!result.erisa}" assignTo="{!cloneOpportunity.erisa}" />
                                                </apex:commandButton>
                                            </div>  
                                        </td>                                       
                                        <td>
                                            <apex:inputText value="{!result.amount}" onblur="decimalCheck(this.value);" styleClass="resizedTextbox"/><!--  disabled="{!result.isAddFlagVisibile}" style="background-color: #ffffff;"/>  -->
                                        </td>
                                        <td>
                                            <apex:selectList value="{!result.currencyVal}" size="1">
                                                <apex:selectOptions value="{!CurrenyList}"/>
                                            </apex:selectList>
                                        </td>
                                        <td>         
                                            <apex:selectList value="{!result.stage}" size="1" id="stageId">
                                                <apex:selectOptions value="{!StageNames}" />
                                                <apex:selectOption itemValue="1-Closed" itemLabel="Closed" itemDisabled="{!if(result.stage=='1-Closed',false,true)}" />
                                            </apex:selectList>
                                        </td>
                                        <td>                                            
                                            <apex:outputPanel id="lostReason">
                                                <apex:selectList value="{!result.lostReason}" size="1">
                                                    <apex:selectOptions value="{!LostReasonList}" />
                                                </apex:selectList>
                                            </apex:outputPanel>
                                        </td>
                                        <td>
                                            <apex:selectList value="{!result.erisa}" size="1" id="erisaId">
                                                <apex:selectOptions value="{!ERISAList}"/>
                                            </apex:selectList>
                                        </td>
                                        <td>
                                            <apex:inputTextarea value="{!result.comments}" rows="1"/>
                                        </td>
                                        <td>
                                            <apex:outputText value="{!result.lastModDate}" />
                                        </td>
                                        <td>
                                            <!-- <apex:outputLink value="/{!result.parentOrgId}" target="_parent" style="color: #015BA7;text-decoration: none;"><apex:outputText value="{!result.parentOrgName}" /></apex:outputLink> -->
                                            <apex:selectList value="{!result.selectedConsultantId}" size="1" rendered="{!result.consultantListFlag}">
                                                <apex:selectOptions value="{!result.consultantList}"/>
                                            </apex:selectList>
                                        </td>
                                        <td>
                                            <apex:inputText value="{!result.consultantAmount}" styleClass="resizedTextbox" rendered="{!result.isAddFlagVisibile}"/>
                                        </td>
                                        <td>
                                            <apex:selectList value="{!result.consultantStatus}" size="1" id="conStatus">
                                                <apex:selectOptions value="{!ConsultantStatus}"/>
                                            </apex:selectList>
                                        </td>
                                        <td>
                                            <apex:inputText value="{!result.actualRaised}" styleClass="resizedTextbox" rendered="{!result.isAddFlagVisibile}" disabled="true"  style="background-color: #ffffff;"/>
                                        </td>                                        
                                        <td>
                                            <div align="center">
                                                <apex:commandButton value="Add" action="{!addRec}" rendered="{!result.isAddFlagVisibile}" reRender="tstpopup">
                                                    <apex:param name="orgId" value="{!result.orgId}" assignTo="{!addOpportunity.orgId}" />
                                                    <apex:param name="stage" value="{!result.stage}" assignTo="{!addOpportunity.stage}" />                                                    
                                                    <apex:param name="currencyVal" value="{!result.currencyVal}" assignTo="{!addOpportunity.currencyVal}" />
                                                    <apex:param name="comments" value="{!result.comments}" assignTo="{!addOpportunity.comments}" />
                                                    <apex:param name="oppId" value="{!result.oppId}" assignTo="{!addOpportunity.oppId}" />
                                                    <apex:param name="fundProduct" value="{!result.fundProduct}" assignTo="{!addOpportunity.fundProduct}" />
                                                    <apex:param name="fundProductName" value="{!result.fundProductName}" assignTo="{!addOpportunity.fundProductName}" />
                                                    <apex:param name="fundClose" value="{!result.fundCloseName}" assignTo="{!addOpportunity.fundClose}" />      
                                                    <apex:param name="erisa" value="{!result.erisa}" assignTo="{!addOpportunity.erisa}" />                                                    
                                                </apex:commandButton>
                                            </div>  
                                        </td>
                                    </tr>
                                    <apex:variable var="rowNum" value="{!rowNum + 1}"/>
                                </apex:repeat>
                            </tbody>
                        </table>
                    </div>
                </div>
            </apex:outputPanel>
            <apex:actionFunction name="lostReasonChk" rerender="lostReason"/> 
            <apex:actionFunction name="filter" action="{!filter}" rerender="dtable, fundCloseId, msgsSection, consultantCB, commRep, pagePanel" status="GetRecordsStatus"/>
            <apex:panelGrid columns="8" id="pagePanel"> 
                <apex:commandButton status="fetchStatus" reRender="dtable, pagePanel" value="|<" id="first" title="0 - 500 Records" action="{!Beginning}" disabled="{!disablePrevious}"/> 
                <apex:commandButton status="fetchStatus" reRender="dtable, pagePanel" value="<" title="Previous 500 Records" action="{!Previous}" disabled="{!disablePrevious}"/>  
                <apex:commandButton status="fetchStatus" reRender="dtable, pagePanel" value=">" title="Next 500 Records" action="{!Next}" disabled="{!disableNext}"/>  
                <apex:commandButton status="fetchStatus" reRender="dtable, pagePanel" value=">|" title="Last Records" action="{!End}" disabled="{!disableNext}"/>
                <apex:outputText style="font-style:italic" value="Page {!pageNumber}" /><span>of</span><apex:outputText style="font-style:italic" value="{!totalPages} - No.of Commitment Summaries {!total_size}"/>
                <apex:outputPanel style="color:#4AA02C;font-weight:bold" >  
                    <apex:actionStatus id="fetchStatus" startText="Fetching..." stopText=""/>  
                </apex:outputPanel>
            </apex:panelGrid> 
        </apex:pageBlock>
   </apex:form>     
</apex:page>
------------------------------------------
global with sharing class CommitmentSummariesController 
{
    public boolean consultantsFlag {get; set;}  
    public ocm_Blue_Sky_Record__c bsr {get; set;}
    public list<CommSummResultWrapper> results {get; set;}  
    public string selectedFP {get;set;} 
    public boolean displayPopup {get; set;}
    public Opportunity childAccount {get;set;}
    private static String sortBy {get;set;}
    private boolean sortAscending {get;set;}
    public ocm_Event__c filterInputEvent {get;set;}
    public string commSumRepId {get;set;}
    public string selectedFPName {get;set;}
    public Integer total_size {get; set;}
    private Integer counter=0;
    private Integer list_size=500;
    public CommSummResultWrapper addOpportunity
    {
        get; 
        set
        {
            addOpportunity = value;
        }
    }
    public CommSummResultWrapper cloneOpportunity
    {
        get; 
        set
        {
            cloneOpportunity = value;
        }
    }
    public CommitmentSummariesController(ApexPages.StandardController controller) 
    {
        consultantsFlag = false;
        displayPopup = false;
        filterInputEvent = new ocm_Event__c();
        bsr = new ocm_Blue_Sky_Record__c();
        bsr.Marketing_Rep__c = Userinfo.getUserId();
        selectedFP = '';
        childAccount = new Opportunity();
        addOpportunity = new CommSummResultWrapper();
        cloneOpportunity = new CommSummResultWrapper();        
        total_size = 0;
        list<Report> commSumRep = [Select Id From Report where DeveloperName ='Commitment_Summary_Report'];
        if(commSumRep != null && commSumRep.size() > 0)
        	commSumRepId = commSumRep[0].id;
    }    
    
    private void loadData()
    {
        results = new list<CommSummResultWrapper>();
        string retSoql = preparingSOQL();        
        retSoql += ' limit '+list_size+' offset '+counter;
        map<id,Opportunity> mapExistedOpps = new map<id,Opportunity>((list<Opportunity>)Database.query(retSoql));
    	
        set<id> accIds = new set<id>();
        for(Opportunity opp : mapExistedOpps.values())
        {
            if(opp.AccountId != null)
                accIds.add(opp.AccountId);
        }        
        map<id, Account> accRelationMap = new map<id, Account>([Select a.Name, a.Id, (Select Account2__c, Account2__r.Name,Account2__r.Type  From Account_to_Accounts__r where Account_Relationship__c = :OCM_Constants.RT_CONSULTING_FIN_ADV_CLIENT) From Account a where (Id IN :accIds)]);
        for(Opportunity opp : mapExistedOpps.values())
        {
            CommSummResultWrapper csw = new CommSummResultWrapper();
            selectedFPName = opp.Fund_Product__r.Name;
            csw.orgId = opp.AccountId;
            csw.orgName = opp.Account.Name;
            csw.orgType = opp.Account.Record_Type_Name__c;
            csw.stage = opp.StageName;
            csw.amount = String.ValueOf(opp.Amount__c);
            csw.currencyVal = opp.Currency__c;
            csw.erisa = opp.ERISA__c;
            csw.comments = opp.Comments_Long__c;
            csw.lostReason = opp.Lost_Reason__c;
            csw.consultantAmount = String.ValueOf(opp.Consultant_Amount__c);
            csw.consultantStatus = opp.Consultant_Status__c;
            csw.actualRaised = String.ValueOf(opp.Actual_Raised__c);
            csw.oppId = opp.id;
            csw.fundProduct = opp.Fund_Product__c;
            csw.fundProductName = opp.Fund_Product__r.Fund_Family_Abbreviation__c;
            csw.fundClose = opp.Fund_Close__c;
            csw.fundCloseName = opp.Fund_Close_Picklist__c;
            csw.oppFundClose = opp.Fund_Close__c;
            csw.oppFundCloseList = getRetFundCloses();
            csw.lastModDate = opp.LastModifiedDate.date().format();
            if((opp.Account.RecordType.DeveloperName == OCM_Constants.CONSULTANT_CLIENT_DEV_NAME) || (opp.Account.RecordType.DeveloperName == OCM_Constants.OCM_RT_ACCOUNT_THIRD_PARTY_ORG))
                csw.isAddFlagVisibile = true;
            else    
                csw.isAddFlagVisibile = false;  
            
            if((accRelationMap != null) && (accRelationMap.containsKey(opp.AccountId)) && (accRelationMap.get(opp.AccountId).Account_to_Accounts__r != null) &&  (accRelationMap.get(opp.AccountId).Account_to_Accounts__r.size() > 0))
            {
                csw.consultantListFlag = true;
                csw.consultantList = accRelatedList(accRelationMap.get(opp.AccountId).Account_to_Accounts__r);
                if(opp.Parent_Opportunity__c  != null)
                {
                    csw.parentOpp = opp.Parent_Opportunity__c;
                    csw.selectedConsultantId = opp.Parent_Opportunity__r.AccountId;
                }    
            }
            else
                csw.consultantListFlag = false;
            results.add(csw);
        }
    }
    
    private string preparingSOQL()
    {   
        String InnerwhrClause = '';
        if(string.isNotBlank(selectedFP))
            InnerwhrClause += ' where (RecordType.DeveloperName = \''+OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS+'\' AND Fund_Product__c = \''+selectedFP+'\')';
        if(bsr != null && bsr.Marketing_Rep__c != null)
            InnerwhrClause += ' AND (OwnerId = \''+bsr.Marketing_Rep__c+'\')'; 
        
        string retSoql = 'Select o.StageName, o.OwnerId, o.LastModifiedDate, o.Total_Amount__c, o.Actual_Raised__c, o.ERISA__c, o.Fund_Close_Picklist__c, o.Fund_Product__c, o.Fund_Product__r.Name, o.Consultant_Amount__c, o.Consultant_Status__c, o.Lost_Reason__c, o.Parent_Opportunity__c, o.Parent_Opportunity__r.AccountId, o.Fund_Product__r.Fund_Family_Abbreviation__c, o.Fund_Close__c, o.Fund_Close__r.Fund_Close_Name__c, o.Comments_Long__c, o.Amount__c, o.Currency__c, o.Account.Primary_Marketing_Representative__c, o.Account.ParentId, o.Account.Parent.Name, o.Account.Name, o.Account.Record_Type_Name__c, o.Account.RecordType.DeveloperName, o.AccountId, (select Id,Name,AccountId,Amount__c From Opportunities__r'+InnerwhrClause+') From Opportunity o where (RecordType.DeveloperName = \''+OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS+'\')';
        if(string.isNotBlank(selectedFP) && consultantsFlag == true)
            retSoql += ' AND (Fund_Product__c = \''+selectedFP+'\' AND (Account.RecordType.DeveloperName = \''+OCM_Constants.CONSULTANT_CLIENT_DEV_NAME+'\' OR Account.RecordType.DeveloperName = \''+OCM_Constants.OCM_RT_ACCOUNT_THIRD_PARTY_ORG+'\'))';
        else if(string.isNotBlank(selectedFP))
            retSoql += ' AND (Fund_Product__c = \''+selectedFP+'\')';
        if(bsr != null && bsr.Marketing_Rep__c != null)
            retSoql += ' AND (OwnerId = \''+bsr.Marketing_Rep__c+'\')'; 
        retSoql += ' Order by Account.Name,Fund_Close_Picklist__c';
        return retSoql; 
    }
    
    public list<SelectOption> getFundCloses()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        if(string.isNotEmpty(selectedFP))
        {
            for(ocm_Fund_Close__c fc : [Select o.Name, o.Id, o.Fund_Family__c, o.Fund_Close_Name__c From ocm_Fund_Close__c o where Fund_Family__c = :selectedFP])
                options.add(new SelectOption(fc.Id, fc.Fund_Close_Name__c));
        }
        return options;
    }
    
    public list<SelectOption> getRetFundCloses()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        options.addAll(SchemaHelper.pickListvalues('Opportunity', 'Fund_Close_Picklist__c'));
        return options;
    }
    
    public list<SelectOption> getCurrenyList()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', ''));
        options.addAll(SchemaHelper.pickListvalues('Opportunity', 'Currency__c'));      
        return options;
    }
 	   
    public list<SelectOption> getConsultantStatus()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        options.addAll(SchemaHelper.pickListvalues('Opportunity', 'Consultant_Status__c'));      
        return options;
    }
    
    public list<SelectOption> getFundProducts()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        //for(ocm_FundFamily__c ff : [Select o.Name, o.Id, o.Fund_Family_Abbreviation__c, o.Strategy__r.Name, o.Strategy__c From ocm_FundFamily__c o where ((Marketing_Status__c = 'Active' OR Marketing_Status__c = 'Pending') AND (RecordType.DeveloperName =: OCM_Constants.OCM_FF_REC_TYPE_EV OR RecordType.DeveloperName =: OCM_Constants.OCM_FF_REC_TYPE_CE)) order by Name])
        for(ocm_FundFamily__c ff : [Select o.Name, o.Id, o.Fund_Family_Abbreviation__c, o.Strategy__r.Name, o.Strategy__c From ocm_FundFamily__c o where ((Marketing_Status__c = 'Active' OR Marketing_Status__c = 'Pending')) order by Name])
            options.add(new SelectOption(ff.Id, ff.Name));
        return options;
    }
    
    private list<SelectOption> accRelatedList(list<ocm_AccounttoAccount__c> a2aList)
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', ''));
        for(ocm_AccounttoAccount__c a2a : a2aList)
            options.add(new SelectOption(a2a.Account2__c, a2a.Account2__r.Name));

        return options;
    }
    
    public list<SelectOption> getLostReasonList()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', ''));
        options.addAll(SchemaHelper.pickListvalues('Opportunity', 'Lost_Reason__c'));       
        return options;
    }
    
    public list<SelectOption> getERISAList()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', '--None--'));
        options.addAll(SchemaHelper.pickListvalues('Opportunity', 'ERISA__c'));       
        return options;
    }
    
    public list<SelectOption> getStageNames()
    {
        list<SelectOption> options = new list<SelectOption>();
        options.add(new SelectOption('', ''));        
        //options.add(new SelectOption('1-Closed', '1-Closed'));
        options.add(new SelectOption('2-Committed', 'Committed'));
        options.add(new SelectOption('3-High', 'High'));
        options.add(new SelectOption('4-Medium', 'Medium'));
        options.add(new SelectOption('5-Low', 'Low'));
        options.add(new SelectOption('X-Lost', 'Lost'));
        //options.add(new SelectOption('Consultant Selected by User','Consultant Selected by User'));
        return options;
    }
    
    public PageReference save()
    {
        Savepoint sp = Database.setSavepoint();
        try
        {
            if(string.isNotBlank(selectedFP))
            {
                if(results != null && results.size() > 0)
                {
                    set<Opportunity> newOppSet = new set<Opportunity>();
                    map<Id, Opportunity> updatedOppMap = new map<Id, Opportunity>();
                    if(pageValidations() == true)
                    {
                        map<String, Opportunity> existedConsultants = new map<String, Opportunity>();
                        String comSummOppRecId = [Select Id From RecordType Where SObjectType =: OCM_Constants.SOBJECT_NAME_OPPORTUNITY AND DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS limit 1].id;
                        map<id, Opportunity> existedOppsMap = new map<id, Opportunity>([Select o.StageName, o.Fund_Close_Picklist__c,o.Total_Amount__c, o.ERISA__c ,o.Fund_Product__c, o.Consultant_Amount__c, o.Consultant_Status__c, o.Lost_Reason__c, o.Parent_Opportunity__c, o.Parent_Opportunity__r.AccountId, o.Fund_Product__r.Fund_Family_Abbreviation__c, o.Fund_Close__c, o.Fund_Close__r.Fund_Close_Name__c, o.Comments_Long__c, o.Amount__c, o.Currency__c, o.Account.Primary_Marketing_Representative__c, o.Account.ParentId, o.Account.Parent.Name, o.Account.Name, o.Account.Record_Type_Name__c, o.Account.RecordType.DeveloperName, o.AccountId, (select Id,Name,AccountId,Amount__c From Opportunities__r where (RecordType.DeveloperName = :OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS AND Fund_Product__c = :selectedFP)) From Opportunity o where (RecordType.DeveloperName = :OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS AND Fund_Product__c = :selectedFP) order by Account.Name]);
                        if(existedOppsMap != null && existedOppsMap.size() > 0)
                        {
                            for(Opportunity oppr: existedOppsMap.values())
                            {
                                string key = oppr.AccountId+ '|' +oppr.Fund_Product__c;//+ '|' +oppr.Fund_Close_Picklist__c;
                                existedConsultants.put(key, oppr);
                            }
                        }
                        set<String> fundNames = new set<String>();
                        set<String> accIdSet = new set<String>();
                        for(CommSummResultWrapper csrw: results)
                        {
                        	if(String.isNotEmpty(csrw.selectedConsultantId))
                        		accIdSet.add(csrw.selectedConsultantId);
                        	if(existedOppsMap != null && existedOppsMap.size() > 0 && existedOppsMap.get(csrw.oppId) != null)
                            {
                            	if(string.isNotBlank(csrw.fundCloseName) && (csrw.fundCloseName != 'TBD'))
                            		fundNames.add(csrw.fundCloseName);
                            }
                        }
                        map<Id, Account> accMap4Name = new map<Id, Account>([Select id, Name, Primary_Marketing_Representative__c from Account where id IN :accIdSet]);
                        //map<String,ocm_Fund_Close__c> ffRecMap = new map<String, ocm_Fund_Close__c>([Select o.Id From ocm_Fund_Close__c o where(Fund_Close_Name__c IN :fundNames AND Fund_Family__c = :selectedFP)]);
                        map<String,ocm_Fund_Close__c> ffRecMap = new map<String, ocm_Fund_Close__c>();
                        for(ocm_Fund_Close__c fc: [Select o.Id, o.Fund_Close_Name__c From ocm_Fund_Close__c o where(Fund_Close_Name__c IN :fundNames AND Fund_Family__c = :selectedFP)])
                        	ffRecMap.put(fc.Fund_Close_Name__c, fc);
                        
                        for(CommSummResultWrapper csrw: results)
                        {
                            Opportunity updatedOpp = new Opportunity(Id = csrw.oppId);
                            boolean isUpdated = false;
                            if(existedOppsMap != null && existedOppsMap.size() > 0 && existedOppsMap.get(csrw.oppId) != null)
                            {
                                if(string.isBlank(csrw.amount))
                                    csrw.amount = null;                             
                                if(String.valueOf(existedOppsMap.get(csrw.oppId).Amount__c) != csrw.amount)
                                {
                                    isUpdated = true;
                                    if(string.isNotBlank(csrw.amount))
                                        updatedOpp.Amount__c = decimal.valueOf(csrw.amount);
                                    else
                                        updatedOpp.Amount__c = null;    
                                }
                                
                                if(string.isBlank(csrw.currencyVal))
                                    csrw.currencyVal = null;
                                if(existedOppsMap.get(csrw.oppId).Currency__c != csrw.currencyVal)
                                {
                                    isUpdated = true;
                                    updatedOpp.Currency__c = csrw.currencyVal;
                                }
                                                                
                                if(string.isBlank(csrw.stage))
                                    csrw.stage = null;
                                if(existedOppsMap.get(csrw.oppId).StageName != csrw.stage)
                                {
                                    if(existedOppsMap.get(csrw.oppId).StageName == 'PPM Sent' || existedOppsMap.get(csrw.oppId).StageName == 'Selected by Rep' || existedOppsMap.get(csrw.oppId).StageName == 'Consultant Selected by User')
                                    {
                                    	if(string.isNotBlank(csrw.stage))
                                    	{
                                    		isUpdated = true;
                                    		updatedOpp.StageName = csrw.stage;
                                    	}
                                    }
                                    else
                                    {
	                                    if(existedOppsMap.get(csrw.oppId).StageName != 'PPM Sent' || existedOppsMap.get(csrw.oppId).StageName != 'Selected by Rep' || existedOppsMap.get(csrw.oppId).StageName != 'Consultant Selected by User')
	                                    {
	                                    	isUpdated = true;
	                                    	updatedOpp.StageName = csrw.stage;
	                                    }
                                    }                                    
                                }
                                
                                if(string.isBlank(csrw.lostReason))
                                    csrw.lostReason = null;
                                if(existedOppsMap.get(csrw.oppId).Lost_Reason__c != csrw.lostReason)
                                {
                                    isUpdated = true;
                                    updatedOpp.Lost_Reason__c = csrw.lostReason;
                                }
                                if(string.isBlank(csrw.fundCloseName))
                                {
                                    csrw.fundCloseName = null;
                                    csrw.oppFundClose = null;                                    
                                }
                                else if(csrw.fundCloseName != 'TBD')
                                {
                                    //list<ocm_Fund_Close__c> ffRec = [Select o.Id, o.Fund_Close_Name__c From ocm_Fund_Close__c o where(Fund_Close_Name__c =:csrw.fundCloseName AND Fund_Family__c = :selectedFP)]; 
                                    if(ffRecMap != null && ffRecMap.size() > 0 && ffRecMap.get(csrw.fundCloseName) != null)
                                        csrw.oppFundClose = ffRecMap.get(csrw.fundCloseName).Id;
                                    else
                                        csrw.oppFundClose = null;
                                }
                                else
                                {
                                    csrw.oppFundClose = null;                                    
                                }    
                                if(existedOppsMap.get(csrw.oppId).Fund_Close_Picklist__c != csrw.oppFundClose)
                                {
                                    isUpdated = true;
                                    updatedOpp.Fund_Close_Picklist__c = csrw.fundCloseName;
                                }
                                
                                if(existedOppsMap.get(csrw.oppId).Fund_Close__c != csrw.oppFundClose)
                                {
                                    isUpdated = true;
                                    updatedOpp.Fund_Close__c = csrw.oppFundClose;
                                }
                                
                                if(string.isBlank(csrw.erisa))
                                    csrw.erisa = null;   
                                if(existedOppsMap.get(csrw.oppId).ERISA__c != csrw.erisa)
                                {                               
                                    isUpdated = true;
                                    updatedOpp.ERISA__c = csrw.erisa;
                                }
                                
                                if(string.isBlank(csrw.comments))
                                    csrw.comments = null;   
                                if(existedOppsMap.get(csrw.oppId).Comments_Long__c != csrw.comments)
                                {                               
                                    isUpdated = true;
                                    updatedOpp.Comments_Long__c = csrw.comments;
                                }
                                if(string.isBlank(csrw.consultantAmount))
                                    csrw.consultantAmount = null; 
                                if(String.Valueof(existedOppsMap.get(csrw.oppId).Consultant_Amount__c) != csrw.consultantAmount)
                                {                                   
                                    isUpdated = true;
                                    if(string.isNotBlank(csrw.consultantAmount))
                                    	updatedOpp.Consultant_Amount__c = decimal.valueOf(csrw.consultantAmount);
                                    else
                                    	updatedOpp.Consultant_Amount__c = null;
                                }
                                if(existedOppsMap.get(csrw.oppId).Consultant_Status__c != csrw.consultantStatus)
                                {                                   
                                    isUpdated = true;
                                    if(string.isNotBlank(csrw.consultantStatus))
                                    	updatedOpp.Consultant_Status__c = csrw.consultantStatus;
                                    else
                                    	updatedOpp.Consultant_Status__c = '';
                                }
                                if(existedOppsMap.get(csrw.oppId).Parent_Opportunity__r.AccountId != null)
                                {
                                    if(string.isNotBlank(csrw.selectedConsultantId))
                                    {
                                        if(existedOppsMap.get(csrw.oppId).Parent_Opportunity__r.AccountId != csrw.selectedConsultantId)
                                        {
                                            string key = csrw.selectedConsultantId + '|' +csrw.fundProduct;//+ '|' +csrw.fundCloseName;
                                            if(existedConsultants != null && existedConsultants.size() > 0)
                                            {
                                                if(!(existedConsultants.containsKey(key)))
                                                {   
                                                    Opportunity newOpp = new Opportunity();
                                                    String dateVal = '1999-1-1'; 
                                                    newOpp.CloseDate = Date.valueOf(dateVal);
                                                    newOpp.AccountId = csrw.selectedConsultantId;
                                                    newOpp.Fund_Product__c = selectedFP;
                                                    newOpp.Fund_Close__c = csrw.oppFundClose;
                                                    newOpp.RecordTypeId = comSummOppRecId;                                          
                                                    newOpp.Lost_Reason__c = csrw.lostReason;
                                                    newOpp.StageName = 'Consultant Selected by User';
                                                    newOpp.Fund_Close_Picklist__c = OCM_Constants.OCM_CONSULTANT_ADVISORY;
                                                    if(accMap4Name != null && accMap4Name.size() > 0 && accMap4Name.get(csrw.selectedConsultantId).Primary_Marketing_Representative__c != null)
                                                    	newOpp.OwnerId = accMap4Name.get(csrw.selectedConsultantId).Primary_Marketing_Representative__c;
                                                    //newOpp.Amount__c = 0;
                                                    newOpp.Currency__c = csrw.currencyVal;
                                                    newOpp.Comments_Long__c = csrw.comments;
                                                    newOpp.Name = csrw.fundProductName+' | '+csrw.fundCloseName;                                            
                                                    insert newOpp;
                                                    
                                                    isUpdated = true;
                                                    OpportunityTriggerHandler.isAfterUpdateCallFire = false;                                    
                                                    updatedOpp.Parent_Opportunity__c = newOpp.Id;
                                                    updatedOpp.Consultant__c = csrw.selectedConsultantId;
                                                }
                                                else
                                                {
                                                    isUpdated = true;
                                                    updatedOpp.Parent_Opportunity__c = existedConsultants.get(key).Id;
                                                    updatedOpp.Consultant__c = existedConsultants.get(key).AccountId;
                                                }                                           
                                            }
                                        }
                                    }
                                    else 
                                    {
                                        Opportunity updatedOpp2 = new Opportunity(Id = existedOppsMap.get(csrw.oppId).Id);
                                        updatedOpp2.Parent_Opportunity__c = null;
                                        if(updatedOppMap.containsKey(updatedOpp2.id))
                                        {
                                            updatedOppMap.get(updatedOpp2.id).Parent_Opportunity__c = null;
                                            updatedOppMap.get(updatedOpp2.id).Consultant__c = null;
                                        }   
                                        else
                                            updatedOppMap.put(updatedOpp2.id, updatedOpp2);
                                    }
                                } 
                                else if(string.isNotBlank(csrw.selectedConsultantId))
                                {
                                    string key = csrw.selectedConsultantId + '|' +csrw.fundProduct;//+ '|' +csrw.fundCloseName;
                                    if(existedConsultants != null && existedConsultants.size() > 0)
                                    {
                                        if(!(existedConsultants.containsKey(key)))
                                        {   
                                            Opportunity newOpp = new Opportunity();
                                            String dateVal = '1999-1-1'; 
                                            newOpp.CloseDate = Date.valueOf(dateVal);
                                            newOpp.AccountId = csrw.selectedConsultantId;
                                            newOpp.Fund_Product__c = selectedFP;
                                            newOpp.Fund_Close__c = csrw.oppFundClose;
                                            newOpp.RecordTypeId = comSummOppRecId;                                          
                                            newOpp.Lost_Reason__c = csrw.lostReason;
                                            newOpp.StageName = 'Consultant Selected by User';
                                            newOpp.Fund_Close_Picklist__c = OCM_Constants.OCM_CONSULTANT_ADVISORY;
                                            if(accMap4Name != null && accMap4Name.size() > 0 && accMap4Name.get(csrw.selectedConsultantId).Primary_Marketing_Representative__c != null)
                                            	newOpp.OwnerId = accMap4Name.get(csrw.selectedConsultantId).Primary_Marketing_Representative__c;
                                            //newOpp.Amount__c = 0;
                                            newOpp.Currency__c = csrw.currencyVal;
                                            newOpp.Comments_Long__c = csrw.comments;
                                            newOpp.Name = csrw.fundProductName+' | '+newOpp.Fund_Close_Picklist__c;                                            
                                            insert newOpp;
                                            
                                            isUpdated = true;
                                            OpportunityTriggerHandler.isAfterUpdateCallFire = false;                                            
                                            updatedOpp.Parent_Opportunity__c = newOpp.Id;
                                            updatedOpp.Consultant__c = csrw.selectedConsultantId;
                                        }
                                        else
                                        {
                                            isUpdated = true;           
                                            updatedOpp.Parent_Opportunity__c = existedConsultants.get(key).Id;    
                                            updatedOpp.Consultant__c = existedConsultants.get(key).AccountId;                                   
                                        }   
                                    }
                                }
                            }
                            if(isUpdated == true)
                                updatedOppMap.put(updatedOpp.id, updatedOpp);
                        }
                        if(updatedOppMap != null && updatedOppMap.size()>0)
                        {
                            list<Opportunity> updatedOpplist = new list<Opportunity>();
                            if(updatedOppMap != null && updatedOppMap.size()>0)
                                updatedOpplist.addAll(updatedOppMap.values());
                            upsert updatedOpplist;
                        }
                        loadData();
                    }
                }    
            }
            else
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please select a Fund/Product to proceed.'));
            return null;
        }
        catch(Exception e)
        {    
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
            Database.rollback(sp);            
            return null;
        }
    }
    
    private boolean pageValidations()
    {
        boolean isValid = true;
        for(CommSummResultWrapper csrw: results)
        {
            /*
            if(((String.isNotBlank(csrw.amount) || String.isNotBlank(csrw.consultantAmount)) && string.isBlank(csrw.currencyVal)) || ((String.isBlank(csrw.amount) && String.isBlank(csrw.consultantAmount)) && string.isNotBlank(csrw.currencyVal)))
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please enter a Currency as well as either a Direct Investment or Consultant Amount for '+csrw.orgName+' to proceed.'));
                return false;
            }
            // need to close
            if(String.isBlank(csrw.fundCloseName))
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please enter a Fund Close for '+csrw.orgName+' to proceed.'));
                return false;
            }
            /*
            if(String.isNotBlank(csrw.stage) && (csrw.stage == 'X-Lost') && String.isBlank(csrw.lostReason))
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please select a Lost Reason for '+csrw.orgName+' to proceed!'));
                return false;
            }
            if(String.isNotBlank(csrw.stage) && (csrw.stage != 'X-Lost') && String.isNotBlank(csrw.lostReason))
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please remove the Lost Reason for '+csrw.orgName+' to proceed!'));
                return false;
            }
            
            if(String.isNotBlank(csrw.stage) && (csrw.stage == '2-Committed' || csrw.stage == '3-High' || csrw.stage == '4-Medium'))
            {
                if((String.isBlank(csrw.amount) && String.isBlank(csrw.consultantAmount)) || string.isBlank(csrw.currencyVal))
                {
                	ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'For Stages “Medium” and above, please provide a Direct Investment or Consultant Projection amount and Currency.'));
                	return false;
                }	
            }
            //need to close
            else 
                isValid = true;     
        }
        return isValid;
    }
    
    public void filter() 
    {
        results = new list<CommSummResultWrapper>();
        counter = 0;
        if(string.isNotBlank(selectedFP))
        {
            list<Opportunity> sizeList = Database.query(preparingSOQL());
        	if(sizeList != null && sizeList.size () > 0)
        		total_size = sizeList.size();

            loadData();
        }    
    } 
    
    public PageReference addRec()
    {
        displayPopup = true;        
        return null;
    }    
    
    public void Beginning() 
    { 
        counter = 0;
        loadData();
    }
    
    public void Previous() 
    { 
        counter -= list_size;
        loadData();
    }
    
    public void Next() 
    { 
        counter += list_size;
        loadData();
    }
    
    public void End() 
    { 
        counter = total_size - math.mod(total_size, list_size);
        loadData();
    }
    
    public Boolean getDisablePrevious() 
    { 
        if(counter>0) 
            return false; 
        else 
            return true;
    }

    public Boolean getDisableNext() 
    {
        if(counter + list_size < total_size) 
            return false; 
        else 
            return true;
    }

    public Integer getPageNumber() 
    {
        return counter/list_size + 1;
    }
    
    public Integer getTotalPages() 
    {
        if(total_size > 0)
        {
	        if(math.mod(total_size, list_size) > 0) 
	            return total_size/list_size + 1;
	        else 
	            return (total_size/list_size);
        }  
        else 
            return 1;  
    }
    
    public PageReference cloneOpp()
    {
        Savepoint sp = Database.setSavepoint();
        try
        {
            if(cloneOpportunity != null)
            {            
                String comSummOppRecId = [Select Id From RecordType Where SObjectType =: OCM_Constants.SOBJECT_NAME_OPPORTUNITY AND DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS limit 1].id;
                //ocm_Fund_Close__c ffRec = [Select o.Fund_Close_Name__c From ocm_Fund_Close__c o where id =:cloneOpportunity.fundClose]; 
                Opportunity opprt = new Opportunity();
                String dateVal = '1999-1-1'; 
                opprt.OwnerId = bsr.Marketing_Rep__c;
                opprt.AccountId = cloneOpportunity.orgId;
                if(string.isNotBlank(cloneOpportunity.amount))
                    opprt.Amount__c = decimal.valueof(cloneOpportunity.amount);
                opprt.Currency__c = cloneOpportunity.currencyVal;
                opprt.StageName = cloneOpportunity.stage;
                opprt.Comments_Long__c = cloneOpportunity.comments;
                opprt.ERISA__c = cloneOpportunity.erisa;
                if(string.isBlank(cloneOpportunity.fundClose))
                {
                    opprt.Fund_Close_Picklist__c = null;
                    opprt.Fund_Close__c = null;                                    
                }
                else if(cloneOpportunity.fundClose != 'TBD')
                {
                    list<ocm_Fund_Close__c> ffRec = [Select o.Id, o.Fund_Close_Name__c From ocm_Fund_Close__c o where(Fund_Close_Name__c =:cloneOpportunity.fundClose AND Fund_Family__c = :selectedFP)]; 
                    if(ffRec != null && ffRec.size() > 0)
                        opprt.Fund_Close__c = ffRec[0].Id;
                    else
                        opprt.Fund_Close__c = null;
                }
                else
                    opprt.Fund_Close__c = null; 
                                                       
                if(string.isNotBlank(cloneOpportunity.fundClose))
                    opprt.Fund_Close_Picklist__c = cloneOpportunity.fundClose;
                
                opprt.Fund_Product__c = cloneOpportunity.fundProduct;
                if(String.isNotBlank(cloneOpportunity.parentOpp))
                    opprt.Parent_Opportunity__c = cloneOpportunity.parentOpp;
                if(String.isNotBlank(cloneOpportunity.selectedConsultantId))
                    opprt.Consultant__c = cloneOpportunity.selectedConsultantId;
                opprt.RecordTypeId = comSummOppRecId;
                opprt.CloseDate = Date.valueOf(dateVal);
                opprt.Name = cloneOpportunity.fundProductName+' | '+cloneOpportunity.fundClose;
                //list<Opportunity> existedOpp = [select id from Opportunity where AccountId = :opprt.AccountId AND Fund_Product__c = :opprt.Fund_Product__c AND Fund_Close_Picklist__c = :opprt.Fund_Close_Picklist__c AND RecordType.DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS];
                list<Opportunity> existedOpp = [select id from Opportunity where AccountId = :opprt.AccountId AND Fund_Product__c = :opprt.Fund_Product__c AND RecordType.DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS];
                if(existedOpp != null && existedOpp.size() > 0)
                {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please select a different Fund Close to proceed as an entry for this Fund Close already exists.'));
                }
                else
                {
                    insert opprt;                
                    displayPopup = false;
                    loadData();
                }                   
            }
            return null;
        }
        catch(Exception e)
        {    
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
            Database.rollback(sp);            
            return null;
        }  
    }
    
    public PageReference saveChildRec()
    {
        Savepoint sp = Database.setSavepoint();
        try
        {
            if(childAccount != null && childAccount.AccountId != null)
            {
                if((String.isNotBlank(addOpportunity.amount) && string.isBlank(addOpportunity.currencyVal)) || (String.isBlank(addOpportunity.amount) && string.isNotBlank(addOpportunity.currencyVal)))
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please provide a Direct Investment and/or Consultant Projection AND a Currency to proceed.  Otherwise, remove both values if unsure.'));
                else
                {
                    String comSummOppRecId = [Select Id From RecordType Where SObjectType =: OCM_Constants.SOBJECT_NAME_OPPORTUNITY AND DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS limit 1].id;
                    Opportunity opprt = new Opportunity();              
                    String dateVal = '1999-1-1'; 
                    opprt.AccountId = childAccount.AccountId;
                    if(string.isNotBlank(addOpportunity.amount))
                        opprt.Amount__c = decimal.valueof(addOpportunity.amount);
                    opprt.Currency__c = addOpportunity.currencyVal;
                    opprt.StageName = addOpportunity.stage;
                    opprt.Comments_Long__c = addOpportunity.comments;
                    opprt.ERISA__c = addOpportunity.erisa;
                    //opprt.Fund_Close__c = addOpportunity.fundClose;
	                if(string.isBlank(addOpportunity.fundClose))
	                {
	                    opprt.Fund_Close_Picklist__c = null;
	                    opprt.Fund_Close__c = null;                                    
	                }
	                else if(addOpportunity.fundClose != 'TBD')
	                {
	                    list<ocm_Fund_Close__c> ffRec = [Select o.Id, o.Fund_Close_Name__c From ocm_Fund_Close__c o where(Fund_Close_Name__c =:addOpportunity.fundClose AND Fund_Family__c = :selectedFP)]; 
	                    if(ffRec != null && ffRec.size() > 0)
	                        opprt.Fund_Close__c = ffRec[0].Id;
	                    else
	                        opprt.Fund_Close__c = null;
	                }
	                else
	                    opprt.Fund_Close__c = null; 
	                                                       
	                if(string.isNotBlank(addOpportunity.fundClose))
	                    opprt.Fund_Close_Picklist__c = addOpportunity.fundClose;
	                    
                    opprt.Fund_Product__c = addOpportunity.fundProduct;
                    opprt.Consultant__c = addOpportunity.orgId;
                    opprt.RecordTypeId = comSummOppRecId;
                    opprt.CloseDate = Date.valueOf(dateVal);
                    opprt.Parent_Opportunity__c = addOpportunity.oppId;
                    opprt.Name = addOpportunity.fundProductName+' | '+addOpportunity.fundClose;
                    
               		//list<Opportunity> existedOpp = [select id from Opportunity where AccountId = :opprt.AccountId AND Fund_Product__c = :opprt.Fund_Product__c AND Fund_Close_Picklist__c = :opprt.Fund_Close_Picklist__c AND RecordType.DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS];
               		list<Opportunity> existedOpp = [select id from Opportunity where AccountId = :opprt.AccountId AND Fund_Product__c = :opprt.Fund_Product__c AND RecordType.DeveloperName =: OCM_Constants.OCM_RT_OPPORTUNITY_CLOSED_END_COMMITMENTS];
	                if(existedOpp != null && existedOpp.size() > 0)
	                {
	                    ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'This investor has already been added to the Commitment Summary.  Please make your updates to the existing row for the Organization.'));
	                }
	                else
	                {
	                    insert opprt;                    
	                    list<ocm_AccounttoAccount__c> chkExistedA2AList = [select id from ocm_AccounttoAccount__c where (Account__c = :opprt.Consultant__c AND Account2__c = :opprt.AccountId AND Account_Relationship__c = :OCM_Constants.RT_CONSULTANT_FIN_ADV) limit 1];
	                    if(!(chkExistedA2AList != null && chkExistedA2AList.size() >0))
	                    {
	                        ocm_AccounttoAccount__c rel = new ocm_AccounttoAccount__c();
	                        rel.Account2__c = opprt.AccountId;
	                        rel.Account__c = opprt.Consultant__c;
	                        rel.Account_Relationship__c = OCM_Constants.RT_CONSULTANT_FIN_ADV;
	                        insert rel;
	                    }
	                    displayPopup = false;
	                    loadData();
	                }
                }
            }
            else
                ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,'Please select an Organization to proceed.'));
            return null;
        }
        catch(Exception e)
        {    
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
            Database.rollback(sp);            
            return null;
        }  
    }
    
    public void closePopup() 
    {        
        displayPopup = false;    
    } 
    
    public void sortData() 
    {
        try 
        {
            if(ApexPages.currentPage().getParameters().get(OCM_Constants.OCM_SORT_BY) != null)
                sortBy = ApexPages.currentPage().getParameters().get(OCM_Constants.OCM_SORT_BY);

            if(filterInputEvent.Subject__c == sortBy) 
                sortAscending = !sortAscending;
            else 
                sortAscending = true;
            
            filterInputEvent.Subject__c = sortBy;
            results.sort();
            if(!sortAscending) 
            {
                list<CommSummResultWrapper> cloneList = results.clone();
                Integer size = results.size();
                for(Integer i=0; i < size; i++) 
                    results[i] = cloneList[size-1-i];
            }
        }
        catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, e.getMessage()));
        }
    }
    
    global class CommSummResultWrapper implements Comparable
    {
        public string orgId {get;set;}      
        public string orgName {get;set;}
        public string oppFundClose {get;set;}
        public list<SelectOption> oppFundCloseList {get;set;}
        public string orgType {get;set;}
        public string stage {get;set;}
        public string lostReason {get;set;}
        public string amount {get;set;}
        public string currencyVal {get;set;}
        public string lastModDate {get;set;}
        public string comments{get;set;}
        public boolean isAddFlagVisibile {get;set;}
        public list<SelectOption> consultantList {get;set;}
        public string selectedConsultantId{get;set;}
        public boolean consultantListFlag{get;set;}
        public string consultantAmount{get;set;}
        public string consultantStatus{get;set;}
        public string actualRaised{get;set;}
        public string oppId {get;set;}
        public string fundProduct{get;set;}
        public string fundProductName{get;set;}
        public string fundClose{get;set;}
        public string fundCloseName{get;set;}
        public string parentOpp{get;set;}
        public string erisa{get;set;}
        global Integer compareTo(Object compareTo) 
        {
            CommSummResultWrapper compareToCSR = (CommSummResultWrapper)compareTo;            
            if(sortBy == 'org') 
            {
                if(orgName == null && compareToCSR.orgName == null)
                    return 0;
                if(orgName == null)
                    return 1;
                if(compareToCSR.orgName == null)
                    return -1;
                return orgName.compareTo(compareToCSR.orgName);
            }
            else if(sortBy == 'stage') 
            {
                if(stage == null && compareToCSR.stage == null)
                    return 0;
                if(stage == null)
                    return 1;
                if(compareToCSR.stage == null)
                    return -1;
                return stage.compareTo(compareToCSR.stage);
            }
            else if(sortBy == 'lastModDate') 
            {
                if(lastModDate == null && compareToCSR.lastModDate == null)
                    return 0;
                if(lastModDate == null)
                    return 1;
                if(compareToCSR.lastModDate == null)
                    return -1;
                if(date.ValueOf(lastModDate) < date.ValueOf(compareToCSR.lastModDate))
                    return -1;
                if(date.ValueOf(lastModDate) > date.ValueOf(compareToCSR.lastModDate))
                    return 1;
                return 0;
            }            
            else if(sortBy == 'consAmount') 
            {
                if(string.isBlank(consultantAmount) && string.isBlank(compareToCSR.consultantAmount))
                    return 0;
                else if(string.isBlank(consultantAmount) && string.isNotBlank(compareToCSR.consultantAmount))                
                    return -1;
                else if(string.isNotBlank(consultantAmount) && string.isBlank(compareToCSR.consultantAmount))
                    return 1;                    
                else if(Integer.ValueOf(consultantAmount) > Integer.ValueOf(compareToCSR.consultantAmount))
                    return 1;
                else if (Integer.ValueOf(consultantAmount) < Integer.ValueOf(compareToCSR.consultantAmount))
                    return -1;
                else if (Integer.ValueOf(consultantAmount) == Integer.ValueOf(compareToCSR.consultantAmount))
                    return 0;  
            }
            else if(sortBy == 'amount') 
            {
                if(string.isBlank(amount) && string.isBlank(compareToCSR.amount))
                    return 0;
                else if(string.isBlank(amount) && string.isNotBlank(compareToCSR.amount))                
                    return -1;
                else if(string.isNotBlank(amount) && string.isBlank(compareToCSR.amount))
                    return 1;                    
                else if(Integer.ValueOf(amount) > Integer.ValueOf(compareToCSR.amount))
                    return 1;
                else if (Integer.ValueOf(amount) < Integer.ValueOf(compareToCSR.amount))
                    return -1;
                else if (Integer.ValueOf(amount) == Integer.ValueOf(compareToCSR.amount))
                    return 0;  
            }
            else if(sortBy == 'currency') 
            {
                if(currencyVal == null && compareToCSR.currencyVal == null)
                    return 0;
                if(currencyVal == null)
                    return 1;
                if(compareToCSR.currencyVal == null)
                    return -1;
                return currencyVal.compareTo(compareToCSR.currencyVal);
            }
            else if(sortBy == 'lostReason') 
            {
                if(lostReason == null && compareToCSR.lostReason == null)
                    return 0;
                if(lostReason == null)
                    return 1;
                if(compareToCSR.lostReason == null)
                    return -1;
                return lostReason.compareTo(compareToCSR.lostReason);
            }  
            return 0;
        }   
    }
}
*/
}