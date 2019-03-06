public class Newoppty_Keerthi {
/* 
 <aura:component controller="CaseNewOverRideController" implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId,forceCommunity:availableForAllPageTypes,force:lightningQuickAction,lightning:actionOverride" access="global" >
    <aura:attribute name="newCase" type="Case" default="{'sobjectType':'Case',
                                                        'Subject':'', 
                                                        'Description':'',
                                                        'End_Customer__c':'',
                                                        'Site_Contact__c':'',
                                                        'Requested_Date_Time__c':'',	 
                                                        'Entitlement':'', 
                                                        'CaseNumber':'',
                                                        'Site_Location__c':'', 
                                                        'Type':'','PO_Number__c':'',
                                                        'Logistics_No__c':'',
                                                        'Cross_Reference__c' :'',
                                                        'Serial_Host__c':'',
                                                        'ProjCode__c':''                                                     
                                                        }" />
    <aura:attribute name="EntitlementRec" type="Entitlement" default="{
                                                                      'sobjectType':'Entitlement',
                                                                      'Parts__c':'',
                                                                      'Coverage_Code__c':'',
                                                                      'Response_Code__c':'',
                                                                      'StartDate':'',
                                                                      'EndDate':''
                                                                      }" />
    <aura:attribute name="newAccount" type="Account" default="{
                                                              'sobjectType':'Account',
                                                              'Name':'',
                                                              'Website':'', 
                                                              'Phone':'', 
                                                              'Fax':'', 
                                                              'IT_Spend__c':'', 
                                                              'BillingAddress':''
                                                              }" />
    <aura:attribute name="endUserAccount" type="Account" default="{
                                                                  'sobjectType':'Account',
                                                                  'Name':'',
                                                                  'Local_Time_Offset__c':''                                                              
                                                                  }" />
    <aura:attribute name="newContact" type="Contact" default="{
                                                              'sobjectType':'Contact',
                                                              'Name':'',
                                                              'Email':'', 
                                                              'Phone':'', 
                                                              'Fax':'', 
                                                              'Account':'', 
                                                              'FirstName':'',
                                                              'LastName':'',
                                                              'Title__c':'',
                                                              'Department':'',
                                                              'Birthdate':''
                                                              }" />
    
    
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <aura:attribute name="selectedLookUpRecord1" type="sObject" default="{}"/>
    <aura:attribute name="selectedLookUpRecord2" type="sObject" default="{}"/>
    <aura:attribute name="selectedLookUpRecord3" type="sObject" default="{}"/>
    <aura:attribute name="selectedLookUpRecord4" type="sObject" default="{}"/>
    
    <aura:attribute name="SiteLocationDevName" type="String" default="Site Location"/>
    
    <aura:attribute name="ShowScreen1" type="Boolean" default="true" /> 
    <aura:attribute name="ShowScreen2" type="Boolean" default="false" />    
    <aura:attribute name="ShowScreen3" type="Boolean" default="false" />
    
    <aura:attribute name="isOpenRecType" type="Boolean" default="true" />
    <aura:attribute name="isOpen" type="Boolean" default="false" />
    <aura:attribute name="isOpen1" type="Boolean" default="false" />
    
    <aura:attribute name="siteLocationId" type="String" default=""  />
    <aura:attribute name="entitlementResponseCode" type="String" default="{}" /> 
    <aura:attribute name="endUserAccountLocalTimeOffset" type="String" default="{}"  />    		
    <aura:attribute name="isDisabledCon" type="Boolean" default="true"/> 
    <aura:attribute name="lookUpLabel" type="String" default=""  />
    <aura:attribute name="objInfo" type="Case" default="{sobjectType : 'Case'}" />
    <aura:attribute name="recTypeIdVar" type="String" default="" />
    <aura:attribute name="lstOfRecordType" type="String[]"/> 
    
    
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    
    <aura:if isTrue="{!v.isOpenRecType}">
        <div role="dialog" tabindex="-1" aria-labelledby="header43" class="slds-modal slds-fade-in-open">
            <div class="slds-modal__container">
                <div class="slds-modal__header">
                    <button class="slds-button slds-modal__close slds-button--icon-inverse" title="Close" onclick="{!c.closeModelForRecTypeSelection}">
                        X<span class="slds-assistive-text">Cancel</span>
                    </button>
                    <h2 id="header43" class="slds-text-heading--medium">New Case</h2>
                </div>
                
                <div class="slds-modal__content slds-p-around--medium">
                    <div class="slds-grid slds-wrap">
                        <div class="slds-size--1-of-2 slds-large-size--1-of-2">
                            <div class="slds-align--absolute-center">Select a Record Type</div>                            
                        </div>
                        <div class="slds-size--1-of-2 slds-large-size--1-of-2">
                            <ui:inputSelect aura:id="selectid">
                                <aura:iteration items="{!v.lstOfRecordType}" var="case">                            
                                    <ui:inputSelectOption text="{!case}" label="{!case}"  />
                                </aura:iteration>
                            </ui:inputSelect>
                        </div>&nbsp; &nbsp;
                    </div>                   
                </div>
                
                <div class="slds-modal__footer">
                    <lightning:button class="slds-button slds-button--neutral" onclick="{!c.closeModelForRecTypeSelection}">Cancel</lightning:button>
                    <lightning:button class="slds-button slds-button--brand" onclick="{!c.caseScreen1}">Next</lightning:button>
                </div>
            </div>
        </div>
        <div class="slds-backdrop slds-backdrop--open"></div>
    </aura:if>
    
    <aura:if isTrue="{!v.ShowScreen1}" > 
        
        <div>
            <div class="slds-grid slds-wrap">     
                <div class="slds-col slds-size_1-of-2 slds-p-right_small"> <!-- begin column 1 -->
                    <div>
                        
                        <c:CaseCustomLookup objectAPIName="Account" IconName="standard:account" label="Account" selectedRecord="{!v.selectedLookUpRecord4}" />
                    </div>
                    <div>
                        <c:CaseCustomLookup objectAPIName="Account" IconName="standard:account" label="End-User Account" notInUseRecType="{!v.SiteLocationDevName}" selectedRecord="{!v.selectedLookUpRecord4}" />
                    </div>
                    
                    <div> 
                        <c:CaseCustomLookup objectAPIName="Account" objectRecordType="siteLocation" siteLocationId="{!v.siteLocationId}" IconName="standard:account" label="Site Location" selectedRecord="{!v.selectedLookUpRecord3}"  />
                    </div>
                    
                    <div class="slds-col--padded">
                        <div class="slds-m-around–xx-large">
                            <button class="slds-button slds-button–brand" onclick="{!c.openModel}">New Account</button> 
                            <aura:if isTrue="{!v.isOpen}">
                                <div role="dialog" tabindex="-1" aria-labelledby="header99" class="slds-modal slds-fade-in-open slds-backdrop">
                                    <div class="slds-modal__container">
                                        <div class="slds-modal__header">
                                            <button class="slds-button slds-modal__close slds-button–icon-inverse" title="Close" onclick="{!c.closeModel}">
                                                X
                                                <span class="slds-assistive-text">Close</span>
                                            </button>
                                            <h2 id="header99" class="slds-text-heading–medium">New Account</h2>
                                        </div>
                                        <div class="slds-modal__content slds-p-around–medium">
                                            <fieldset class="slds-form–compound">
                                                <div class="slds-form-element">
                                                    <label class="slds-form-element__label" >Account Name</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="AccountName" class="slds-input"  value="{!v.newAccount.Name}" />
                                                    </div>
                                                    <label class="slds-form-element__label" >Website</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="AccountWebsie" class="slds-input"  value="{!v.newAccount.Website}"  />
                                                    </div>
                                                    <label class="slds-form-element__label" >Phone</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="AccountPhone" class="slds-input"  value="{!v.newAccount.Phone}"  />
                                                    </div>
                                                    <label class="slds-form-element__label" >Fax</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="AccountFax" class="slds-input"  value="{!v.newAccount.Fax}"  />
                                                    </div>
                                                    
                                                    <label class="slds-form-element__label" >IT spend</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="AccountITspend" class="slds-input"  value="{!v.newAccount.IT_Spend__c}"  />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="slds-modal__footer">
                                            <button class="slds-button slds-button–neutral" onclick="{!c.closeModel}" >Cancel</button>
                                            <button class="slds-button slds-button–brand" onclick="{!c.saveAccount}">Save</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="slds-backdrop slds-backdrop–open"></div>
                            </aura:if>   
                        </div>
                    </div> 
                    
                    <div>
                        <ui:inputText aura:id="CaseLogisticsNo" label="Logistics No."
                                      class="slds-input"
                                      labelClass="slds-form-element__label"
                                      value="{!v.newCase.Logistics_No__c}" 
                                      />
                    </div>
                    <div>
                        <ui:inputText aura:id="CasePONumber" label="PO Number"
                                      class="slds-input"
                                      labelClass="slds-form-element__label"
                                      value="{!v.newCase.PO_Number__c}" 
                                      />
                    </div>   
                    <div>
                        <!--   <ui:inputText aura:id="CaseProjectCode" label="Project Code"
                        class="slds-input"
                        labelClass="slds-form-element__label"
                        value="{!v.newCase.ProjCode__c}" 
                        /> -->
                        <div>
                            Project Code
                            <div >
                                <ui:inputSelect aura:id="projectCode" class="slds-select"  change="{!c.onPicklistChange}" value="{!v.newCase.ProjCode__c}"  />
                            </div>
                        </div>     
                    </div>  
                    
                </div><!-- end column 1 -->
                
                <div class="slds-col slds-size_1-of-2 slds-p-left_small"><!-- begin column 2 -->        
                    
                    <div>
                        <c:CaseCustomLookup objectAPIName="Entitlement" IconName="standard:entitlement" label="Product Info" selectedRecord="{!v.selectedLookUpRecord2}"  />
                    </div>
                    
                    <fieldset disabled='{! !v.siteLocationId ? true:false}'>
                        <aura:if isTrue="{!v.siteLocationId ? true:false}" >
                            <c:CaseCustomLookup objectAPIName="Contact" siteLocationId="{!v.siteLocationId}" IconName="standard:contact"  label="Site Contact" selectedRecord="{!v.selectedLookUpRecord1}"  />
                            <aura:set attribute="else">
                                <c:CaseCustomLookup objectAPIName="Contact" siteLocationId="{!v.siteLocationId}" IconName="standard:contact"  label="Site Contact" selectedRecord="{!v.selectedLookUpRecord1}"  />				
                            </aura:set>
                        </aura:if>
                        
                    </fieldset>
                    <div class="slds-col--padded">
                        <div class="slds-m-around–xx-large">
                            <button class="slds-button slds-button–brand" onclick="{!c.openModel1}">New Contact</button> 
                            <aura:if isTrue="{!v.isOpen1}">
                                <div role="dialog" tabindex="-1" aria-labelledby="header99" class="slds-modal slds-fade-in-open slds-backdrop">
                                    <div class="slds-modal__container">
                                        <div class="slds-modal__header">
                                            <button class="slds-button slds-modal__close slds-button–icon-inverse" title="Close" onclick="{!c.closeModel}">
                                                X
                                                <span class="slds-assistive-text">Close</span>
                                            </button>
                                            <h2 id="header99" class="slds-text-heading–medium">New Contact</h2>
                                        </div>   
                                        <div class="slds-modal__content slds-p-around–medium">

                                            <div>
                                                <c:CaseCustomLookup objectAPIName="Account" IconName="standard:account" label="Account Name" selectedRecord="{!v.selectedLookUpRecord4}" />
                                            </div>
                                            <fieldset class="slds-form–compound">
                                                <div class="slds-form-element">
                                                    <label class="slds-form-element__label" >First Name</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="FirstName" class="slds-input"  value="{!v.newContact.FirstName}" />
                                                    </div>
                                                    <label class="slds-form-element__label" >Last Name</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="LastName" class="slds-input"  value="{!v.newContact.LastName}" />
                                                    </div>
                                                    
                                                    <label class="slds-form-element__label" >Email</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="ContEmail" class="slds-input"  value="{!v.newContact.Email}"  />
                                                    </div>
                                                    <label class="slds-form-element__label" >Phone</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="ContPhone" class="slds-input"  value="{!v.newContact.Phone}"  />
                                                    </div>                        
                                                    
                                                    <label class="slds-form-element__label" >Department</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputText aura:id="ContDepartment" class="slds-input"  value="{!v.newContact.Department}"  />
                                                    </div>
                                                    <label class="slds-form-element__label" >BirthDate</label>
                                                    <div class="slds-form-element__control">
                                                        <ui:inputDate aura:id="ContactBirthdate" class="slds-input"  value="{!v.newContact.BirthDate}" displayDatePicker="true"  />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="slds-modal__footer">
                                            <button class="slds-button slds-button–neutral" onclick="{!c.closeModel1}" >Cancel</button>
                                            <button class="slds-button slds-button–brand" onclick="{!c.saveContact}">Save</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="slds-backdrop slds-backdrop–open"></div>
                            </aura:if>    
                        </div>
                    </div> 
                    
                    <div>
                        <ui:inputText aura:id="CaseCrossReference" label="Cross Reference"
                                      class="slds-input"
                                      labelClass="slds-form-element__label"
                                      value="{!v.newCase.Cross_Reference__c}" 
                                      />
                    </div>
                    
                    <div>
                        <ui:inputText aura:id="CaseSerialHost" label="Serial Host"
                                      class="slds-input"
                                      labelClass="slds-form-element__label"
                                      value="{!v.newCase.Serial_Host__c}"  
                                      />
                    </div>
                </div><!-- end column 2 -->  
                <br/>
                <div class="slds-col slds-size_2-of-2">
                    
                    <div>
                        <ui:inputText aura:id="CaseSub" label="Subject"
                                      class="slds-input"
                                      labelClass="slds-form-element__label" 
                                      value="{!v.newCase.Subject}" 
                                      />
                    </div> 
                    
                    
                    
                    <div>
                        <ui:inputTextArea aura:id="CaseDescription" label="Description"
                                          class="slds-input"
                                          labelClass="slds-form-element__label"
                                          value="{!v.newCase.Description}"
                                          />
                    </div>
                </div>  
                <br/>
                <div class="slds-col slds-size_2-of-2">
                    <div class="slds-align_absolute-center">     
                        <lightning:button variant="brand" label="Continue" iconName="utility:submit" iconPosition="center" onclick="{!c.continue}" />
                        
                    </div>   
                </div>
                
                
            </div><!-- end table -->
        </div>
        
    </aura:if> 
    <aura:if isTrue="{!v.ShowScreen2}" >
        <div>
            
            <div>
                
                
                <ui:inputDateTime aura:id="requestedDate" label="Requested Date and Time" displayDatePicker="true"
                                  
                                  value="{!v.newCase.Requested_Date_Time__c}"/></div>
            <br/>   
            
            
            <div class="slds-card">
                <div class="slds-card__header slds-grid">
                    <div class="slds-media__body">
                        <h2 class="slds-text-heading--small slds-truncate">Entitlement Details</h2>
                    </div>
                </div>
                <div class="slds-card__body">
                    <table class="slds-table slds-table--bordered slds-max-medium-table--stacked-horizontal slds-no-row-hover">
                        <thead>
                            <tr>
                                <th class="slds-text-heading--label slds-size--1-of-4" scope="col">Parts</th>
                                <th class="slds-text-heading--label slds-size--1-of-4" scope="col">Coverage Code</th>
                                <th class="slds-text-heading--label slds-size--1-of-4" scope="col">Response Code</th>
                                <th class="slds-text-heading--label slds-size--1-of-4" scope="col"> Start Date</th>
                                <th class="slds-text-heading--label slds-size--1-of-4" scope="col"> End Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="slds-hint-parent">
                                <td class="slds-size--1-of-4" data-label="Name"><ui:outputText title="Entitlement Parts" value="{!v.EntitlementRec.Parts__c}" /></td>
                                <td class="slds-size--1-of-4" data-label="Company"><ui:outputText title="Entitlement Coverage Code" value="{!v.EntitlementRec.Coverage_Code__c}" /></td>
                                <td class="slds-size--1-of-4" data-label="Title"><ui:outputText title="Entitlement Response Code" value="{!v.EntitlementRec.Response_Code__c}" /></td>
                                <td class="slds-size--1-of-4" data-label="Start Date"><ui:outputDate value="{!v.EntitlementRec.StartDate}" /></td>
                                <td class="slds-size--1-of-4" data-label="End Date"><ui:outputDate value="{!v.EntitlementRec.EndDate}" /></td>
                            </tr>
                        </tbody>
                    </table>   
                </div>    
            </div>  
            <br/>
            
            
            <div class="slds-size--2-of-12 slds-align_absolute-center">
                <lightning:button variant="brand" label="Previous" iconName="utility:submit" iconPosition="center" onclick="{!c.previousAction}" />     
                <lightning:button variant="brand" disabled="{!v.dateValidationError}" label="Submit" iconName="utility:submit" iconPosition="center" onclick="{!c.saveCaseRecord}" />        
                
                <lightning:button variant="brand" label="Cancel" iconName="utility:submit" iconPosition="center" onclick="{!c.cancelAction}" />
                
            </div>
            
        </div> 
    </aura:if>
</aura:component>
---------------------------------------------------
({
    doInit: function(component, event, helper) {
        // helper.fetchPickListVal(component, 'ProjCode__c', 'projectCode');
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            component.set("v.lstOfRecordType", response.getReturnValue());
        });
        $A.enqueueAction(action);
        
    },
    
    
    onPicklistChange: function(component, event, helper) {
        //get the value of select option 
        // alert(event.getSource().get("v.value")); 
    },
    /*  openModelForRecTypeSelection: function(component, event, helper) {
		// for Display Model,set the “isOpen” attribute to “true”		 
		component.set("v.isOpenRecType", true);
	},
    closeModelForRecTypeSelection: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
        component.set("v.isOpenRecType", false);
    },
    caseScreen1: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
       // component.set("v.ShowScreen1", true);
        component.set("v.isOpenRecType", false);
        var action = component.get("c.getRecTypeId");
        var recTypeLabel = component.find("selectid").get("v.value");
        alert(recTypeLabel);
        action.setParams({
            "recordTypeLabel": recTypeLabel
        });  
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("first callbak "+ response.getReturnValue() );
                var RecTypeID  = response.getReturnValue();
                alert(RecTypeID);
                component.set("v.recTypeIdVar",RecTypeID);
                component.set("v.ShowScreen1", true);
                component.set("v.isOpenRecType", false);
                
            }
            else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
        // SiteLocationDevName
        console.log("before SiteLocationDevName-" + JSON.stringify(component.get("v.selectedLookUpRecord4")) );
        var action2 = component.get("c.getAccountRecTypeId");
        action2.setParams({
            "recordTypeLabel": "Site Location"
        });  
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.SiteLocationDevName", response.getReturnValue());
                console.log("after SiteLocationDevName-" + response.getReturnValue() );
            }
        });
        $A.enqueueAction(action2);
        
    },
    
    openModel: function(component, event, helper) {
        // for Display Model,set the “isOpen” attribute to “true”		 
        component.set("v.isOpen", true);
    },
    openModel1: function(component, event, helper) {
        // for Display Model,set the “isOpen” attribute to “true”		 
        component.set("v.isOpen1", true);
    }, 
    closeModel: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
        component.set("v.isOpen", false);
    },
    closeModel1: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
        component.set("v.isOpen1", false);
    },
    saveAccount : function(component, event, helper) {      
        
        var accRecord = component.get("v.newAccount");
        console.log('Accc is: '+JSON.stringify(accRecord));
        var action = component.get("c.createNewAcc");
        action.setParams({
            accObj : accRecord 
        }); 
        
        action.setCallback(this,function(a){
            var state = a.getState();
            console.log('state is:'+state);             
            
            //check if result is successfull
            if(state == "SUCCESS"){
                console.log('Return values'+JSON.stringify(a.getReturnValue()));  
                component.set("v.isOpen", false);
                var isopenvar = component.get("v.isOpen");
                console.log('ISopen :'+isopenvar); 
                
            } 
            else if(state == "ERROR"){
                var errors = a.getError();
                console.log('Error is:'+errors);
                $A.log("Errors", JSON.stringify(a.getError()));
                
            }
        });
        
        $A.enqueueAction(action);                                                 
        
    },
    saveContact : function(component, event, helper) { 
        
        var contactRec = component.get("v.newContact");
        console.log('Contat is :'+JSON.stringify(contactRec));
        contactRec.AccountId = null ;  
        
        var acclookup =component.get("v.selectedLookUpRecord4");
        console.log('acc id @@@@'+JSON.stringify(acclookup));
        if(component.get("v.selectedLookUpRecord4").Id != undefined ){
            
            contactRec.AccountId = component.get("v.selectedLookUpRecord4").Id;
            
        }
        console.log('next@@@'+JSON.stringify(contactRec));
        var action = component.get("c.createNewContact");
        action.setParams({
            contactObj : contactRec 
        }); 
        
        action.setCallback(this,function(a){
            var state = a.getState();
            console.log('state is:'+state);             
            
            //check if result is successfull
            if(state == "SUCCESS"){
                console.log('Return values'+JSON.stringify(a.getReturnValue()));  
                component.set("v.isOpen1", false);
                var isopenvar = component.get("v.isOpen1");
                console.log('ISopen1 :'+isopenvar); 
                
            } 
            else if(state == "ERROR"){
                var errors = a.getError();
                console.log('Error is:'+errors);
                $A.log("Errors", JSON.stringify(a.getError()));
                
            }
        });
        
        $A.enqueueAction(action);                                                 
        
    },
    continue : function(component, event, helper) { 
    console.log('entered into continue');
    var caseObject = component.get("v.newCase");
    //set the default accountId is null 
    caseObject.End_User_Account__c = null ; 
    caseObject.Entitlement=null;
    if(component.get("v.selectedLookUpRecord2").Id != undefined ){
    caseObject.EntitlementId = component.get("v.selectedLookUpRecord2").Id;
} 
 
 if(component.get("v.selectedLookUpRecord").Id != undefined ){
    caseObject.End_User_Account__c = component.get("v.selectedLookUpRecord").Id;
}


var entlResponsceCode1 = component.get("v.entitlementResponseCode");
var entitlementRecId = component.get("v.newCase.EntitlementId");
//console.log('entlResponsceCode1 line 19'+entlResponsceCode1);
console.log('Entitlement id is:'+entitlementRecId);
var action = component.get("c.fetchEntitlementRecord");  
action.setParams({
    entlId : entitlementRecId
});	

action.setCallback(this,function(a){
    var state = a.getState();
    
    //check if result is successfull  
    if(state == "SUCCESS"){
        console.log('Return values3535'+JSON.stringify(a.getReturnValue()));
        component.set("v.EntitlementRec",a.getReturnValue());               
        component.set("v.ShowScreen2",true);
        component.set("v.ShowScreen1",false); 
        var entitlementResponseCodeVar = component.get("v.EntitlementRec.Response_Code__c");
        console.log('entitlementResponseCodeVar@@'+entitlementResponseCodeVar);
        component.set("v.entitlementResponseCode",entitlementResponseCodeVar); 
        var entlResponsceCode = component.get("v.entitlementResponseCode");
        console.log('entlResponsceCode +++++'+entlResponsceCode);
        helper.endUserAccount(component, event, helper);
    }
}  
                   
                  );
$A.enqueueAction(action);

},
    cancelAction : function(component, event, helper) {
        
        component.set("v.ShowScreen1",false);
        component.set("v.ShowScreen2",false);
        component.set("v.ShowScreen3",false);
        //component.set("v.ShowScreen4",true);
        
        
    } ,
        previousAction : function(component, event, helper) {
            
            component.set("v.ShowScreen1",true);
            component.set("v.ShowScreen2",false);
            component.set("v.ShowScreen3",false);
            //component.set("v.ShowScreen4",false);
            
            var caseObject = component.get("v.newCase");     
            caseObject.Site_Location__c=null;
            
        } ,
            saveCaseRecord : function(component, event, helper) {
                //helper.validateCase(component);
                //   var isDateError = component.get("v.dateValidationError");
                
                /*    if(isDateError != false){
            alert('date is Invalid.. Please select Current or Future date.');
        } 
        // if(isDateError != true){
        console.log('entered into create');
        var caseObject = component.get("v.newCase");
        console.log('tessx'+JSON.stringify(caseObject));
        
        caseObject.Site_Contact__c=null;
        //caseObject.Entitlement=null;
        caseObject.Site_Location__c=null;
        caseObject.Type='Break/Fix';
        
        // check if selectedLookupRecord is not equal to undefined then set the accountId from 
        // selected Lookup Object to Case Object before passing this to Server side method
        
        if(component.get("v.selectedLookUpRecord1").Id != undefined ){
            caseObject.Site_Contact__c = component.get("v.selectedLookUpRecord1").Id;
        } 
        /* if(component.get("v.selectedLookUpRecord2").Id != undefined ){
          caseObject.EntitlementId = component.get("v.selectedLookUpRecord2").Id;
        } 
        if(component.get("v.selectedLookUpRecord3").Id != undefined ){
            caseObject.Site_Location__c = component.get("v.selectedLookUpRecord3").Id;
        }    
        
        console.log('next@@@'+JSON.stringify(caseObject));         
        //call apex class method      
        var caseRecTypeId=component.get("v.recTypeIdVar"); 
        alert('caseRecTypeId ++ :'+caseRecTypeId);
        var action = component.get('c.saveCase');        
        action.setParams({ 
            caseobj: caseObject,
            rectypeid:caseRecTypeId
        })
        action.setCallback(this, function(a) {
            //store state of response
            var state = a.getState();
            console.log('status is'+state);
            if (state == "SUCCESS") {    
                console.log('Return values'+JSON.stringify(a.getReturnValue()));            
                component.set("v.newCase",a.getReturnValue());
                var NewCaseValues = component.get("v.newCase.CaseNumber");
                console.log('NewCaseValues:  '+NewCaseValues); 
                component.set("v.ShowScreen1", false);
                component.set("v.ShowScreen2", false);
                component.set("v.ShowScreen3", true);                    
                
            }
            else if(state == "ERROR"){
                var errors = a.getError();
                helper.handleErrors(errors);
                
                
                console.log("Exception caught successfully");
                console.log("Error object", a);
                console.log("Error Message", a.getError()[0]);
                console.log("Error Message", a.getError()[0].message);
                console.log("Error Message", a.getState());
                console.log("Error object", JSON.stringify(a));
                //component.set("v.errMessage", a.getError()[0].message);
                
            }
        });
        $A.enqueueAction(action); 
        // }
    }

})
-----------------------------------------------------------------------------------
({
    endUserAccount : function(component, event, helper) {
        
        var endUserAccountRecId = component.get("v.newCase.End_User_Account__c");
        console.log('endUserAccountRecId IS:'+endUserAccountRecId);
        
        
        var test3 = component.get("v.entitlementResponseCode");      
        console.log('Entitletest3$$$$$$$$$$$$$$'+test3); 
        
        var action = component.get("c.fetchEndUserAccount");  
        action.setParams({
            endUserAccId : endUserAccountRecId
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                console.log('Return values4444'+JSON.stringify(a.getReturnValue()));
                component.set("v.endUserAccount",a.getReturnValue());
                var endUserAccountLocalTimeVar = component.get("v.endUserAccount.Local_Time_Offset__c");  
                console.log('endUserAccountLocalTimeVar'+endUserAccountLocalTimeVar);
                component.set("v.endUserAccountLocalTimeOffset",endUserAccountLocalTimeVar);		
                var endUserAccLocalOffset = component.get("v.endUserAccountLocalTimeOffset");
                console.log('endUserAccLocalOffset +++++'+endUserAccLocalOffset);  
                this.dueDate(component, event, helper);
            }
        });
        $A.enqueueAction(action);   
    },
    dueDate : function(component, event, helper) {
        
        var entResponseCode = component.get("v.entitlementResponseCode");      
        console.log('Entitletest4$$$$$$$$$$$$$$'+entResponseCode);
        var endUserAccTimeOffset = component.get("v.endUserAccountLocalTimeOffset");      
        console.log('TimeOFffset$$$$$$$$$$$$$$'+endUserAccTimeOffset);
        var action = component.get('c.getDueDate');
        action.setParams({
            "responseCode": entResponseCode,
            "localTimeoffset":endUserAccTimeOffset
        })
        action.setCallback(this,function(a){
            var state = a.getState();
            
            //check if result is successfull 
            if(state == "SUCCESS"){
                console.log('Return values666'+JSON.stringify(a.getReturnValue()));
                var duedates = a.getReturnValue(); 
                console.log('firs value: '+duedates);
                //console.log('Second value: '+duedates[1]);
                
                
                component.set("v.newCase.Requested_Date_Time__c",$A.localizationService.formatDateTime(duedates,"yyyy-MM-dd\'T\'HH:mm:ss.SSS "));
                
                //component.set("v.newCase.Requested_Date_Time__c",a.getReturnValue()); 
                //component.set("v.today",a.getReturnValue())
                
                // testDate = new Date(component.get("v.newCase.Requested_Date_Time__c"));
                // console.log('testDate **'+testDate);
                
                //  var reqDateTime = component.get("v.newCase.Requested_Date_Time__c");
                //  console.log('reqTime $$$$'+reqDateTime);
                //   var reqDateTime1 = reqDateTime.toISOString();
                //   console.log('ReqDateTime1'+reqDateTime1);
                //   component.set("v.newCase.Requested_Date_Time__c", reqDateTime1
                
                
                var reqDate = component.get("v.newCase.Requested_Date_Time__c");
                console.log('reqDateTime@@@'+reqDate);
                
                
            }
        });
        $A.enqueueAction(action);  
        
    },
    
    fetchPickListVal: function(component, fieldName, elementId) {
        var action = component.get("c.getselectOptions");
        action.setParams({
            "objObject": component.get("v.objInfo"),
            "fld": fieldName 
        });
        var opts = [];
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.find(elementId).set("v.options", opts);
            }
        });
        $A.enqueueAction(action);
    },
    
    handleErrors : function(errors) {
        // Configure error toast
        let toastParams = {
            title: "Error",
            message: "Unknown error", // Default error message
            type: "error"
        };
        // Pass the error message if any
        if (errors && Array.isArray(errors) && errors.length > 0) {
            toastParams.message = errors[0].message;
        }
        // Fire error toast
        let toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams(toastParams);
        toastEvent.fire();
    },
    
})
--------------------------------------------------------------------
public class CaseNewOverRideController {
    
   public static Map<Id, String> recordtypemap {get;set;}
    
   @AuraEnabled        
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = Case.SObjectType.getDescribe().getRecordTypeInfos();    
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
            recordtypemap.put(rt.getRecordTypeId(), rt.getName());
        }        
        return recordtypemap.values(); 
    }
    
    @AuraEnabled
    public static Id getRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.case.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();        
        return recid;
    }
    @AuraEnabled
    public static Id getAccountRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Account.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();        
        return recid;
    }
    
    @AuraEnabled
    public static case  saveCase (Case caseobj,id caseRecTypeId) 
    {
         try{
        if(caseobj != null)       
           insert caseobj;   
           system.debug('Case number is: '+caseobj.CaseNumber);
           caseobj.recordtypeid = 'caseRecTypeId';
           system.debug('New Case Rec Id'+ caseobj.recordtypeid);
           update caseobj;
           Case caseVar = [select casenumber from case where id =:caseobj.id];
           string  caseNumberVar = caseVar.casenumber;       
           return caseVar;
         }
        catch (Exception e) {
        throw new AuraHandledException('Error : ' 
            + e.getMessage());             
        }
    }
     
    @AuraEnabled
    public static case fetchCaseRecord(Id caseId) {
        case varCase =[select id,Subject,Description,End_Customer__c,Site_Contact__c,Requested_Date_Time__c,Entitlementid,CaseNumber,Type,Entitlement.Parts__c,Entitlement.Coverage_Code__c,Entitlement.Response_Code__c,Entitlement.StartDate,Entitlement.EndDate from case where id =:caseId];

        return varCase;
    }
    
    @AuraEnabled
    public static Entitlement fetchEntitlementRecord(Id entlId) {
        Entitlement varEntitlement =[select id,Parts__c,Coverage_Code__c,Response_Code__c,StartDate,EndDate from Entitlement where id =:entlId];
        return varEntitlement;
    }
    
    @AuraEnabled
    public static Account fetchEndUserAccount(Id endUserAccId) {
        Account varEndUserAccount =[select id,Name,Local_Time_Offset__c from Account where id =:endUserAccId];
        return varEndUserAccount;
    }
   
    @AuraEnabled
    public static void createNewAcc(Account accObj) {
        insert accObj;
    }
    
    @AuraEnabled
    public static void createNewContact(Contact contactObj) {
        insert contactObj;
    }
    
    @AuraEnabled
    public static List < String > getselectOptions(sObject objObject, string fld) {
  system.debug('objObject --->' + objObject);
  system.debug('fld --->' + fld);
  List < String > allOpts = new list < String > ();
  // Get the object type of the SObject.
  Schema.sObjectType objType = objObject.getSObjectType();
 
  // Describe the SObject using its object type.
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
 
  // Get a map of fields for the SObject
  map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
 
  // Get the list of picklist values for this field.
  list < Schema.PicklistEntry > values =
   fieldMap.get(fld).getDescribe().getPickListValues();
 
  // Add these values to the selectoption list.
  for (Schema.PicklistEntry a: values) {
   allOpts.add(a.getValue());
  }
  system.debug('allOpts ---->' + allOpts);
  allOpts.sort();
  return allOpts;
 }
 
  @AuraEnabled
    public static DateTime getDueDate(string responseCode, string localTimeoffset) {
        
        system.debug('responsceCode@@@@'+responseCode); 
        system.debug('localTimeoffset@@@@@'+localTimeoffset); 
        try
        {
            //Case caseRec = [Select responseCode, localTimeoffset From Case Where Id =: caseIdsFromFlow[0]];
            // responseCode localTimeoffset
            DateTime currentTime = System.now();
            //Convert DateTime zone from GMT Timezone to EST Time Zone
            DateTime createDateInEST = DateTime.valueOf(currentTime.format('yyyy-MM-dd HH:mm:ss', 'ET'));
            DateTime dueDate ; 
            String localOffset = localTimeoffset;
            if(responseCode != null){
                //get the current time in the GMT
                //List<DateTime> dateTimeList = new List<DateTime>();
                String response_Code = responseCode;
                Integer dateSetter ; 
                
                //if first character of ResponseCode is numeric and ResponseCode doesn't equal '8X5X10'
                if(!response_Code.containsIgnoreCase('8X5X10') && response_Code.left(1).isNumeric()){
                    system.debug('condition 1 execute');
                    //get the minutes from the converted createdDateTime
                    Integer createDateMinute = currentTime.minute();
                    system.debug('createdDateTime-->'+createDateMinute);
                    //when createDateMinute between '00' and '14' then dateSetter = '45:00.000'
                    if(createDateMinute >= 0 && createDateMinute <= 14){
                        dateSetter = 45;
                    }else if(createDateMinute >= 15 && createDateMinute <= 29){
                        //when timeVar between '15' and '29' then dateSetter = '00:00.000'
                        dateSetter = 00;
                    }else if(createDateMinute >= 30 && createDateMinute <= 44){
                        //when timeVar between '30' and '44' then dateSetter = '15:00.000' 
                        dateSetter = 15;    
                    }else if(createDateMinute >= 45 && createDateMinute <= 59){
                        ////when timeVar between '45' and '59' then dateSetter = '30:00.000'
                        dateSetter = 30;    
                    }
                    //if dateSetter = '45:00.000'
                    //Convert createdDateTime to yyyy-mm-dd hh:mi:ss.mmm format 
                    //Substring first 14 characters
                    //createdDateTime = Add the result to dateSetter and subtract 1 hour
                    if(dateSetter == 45){
                        dueDate = createDateInEST.addHours(dateSetter - 1);
                        system.debug('Due time @@@@'+dueDate);  
                    }else{
                        //createdDateTime and Add the result to dateSetter
                        dueDate = createDateInEST.addHours(dateSetter);
                        system.debug('Due time @@@@'+dueDate);   
                    }
                    //Get the index of the space ‘ ‘ in responseCode and Substring responseCode from first character to index
                    //convert it to an integer and add this as hours to createdDateTime
                    if(response_Code.indexOf(' ') != -1){
                        String subString = response_Code.subString(0, response_Code.indexOf(' '));
                        if(subString.isNumeric()){
                            dueDate = dueDate.addHours(Integer.valueOf(subString));
                        }
                    }
                    // Convert createdDateTime to custDateTime
                    if(localOffset != null){
                        dueDate = dueDate.addHours(- Integer.valueOf(localOffset));
                    }
                    return dueDate;
                    
                }else if(response_Code.length() >1 && response_Code.left(2) == 'NB'){
                    system.debug('condition 2 execute');
                    Map<Integer, Datetime > counterWithCreatedDate = new Map<Integer, Datetime>();
                    
                    //apply the User Local Offset into the dateTime value
                    if(localOffset != null){
                        dueDate = createDateInEST.addHours(-Integer.valueOf(localOffset));
                    }else{
                        dueDate = createDateInEST;
                    }
                    
                    //If the first two characters of ResponseCode = ‘NB’
                    Integer counter =0;
                    //Store the counter and createdDateTime as a key/value pair
                    counterWithCreatedDate.put(counter, dueDate);
                    
                    for(Integer i=1; i<=10; i++){
                        DateTime newDateTime = dueDate.addDays(i);
                        //If createdDateTime is not a weekend or a holiday then Store createdDateTime and counter in the key/value pair
                        //Need to add the get the Holidays from the Org and use those days for holidays  
                        if(!newDateTime.format('EEEE').equalsIgnoreCase('Saturday') && !newDateTime.format('EEEE').equalsIgnoreCase('Sunday')){
                            counterWithCreatedDate.put(i, newDateTime);
                        }
                    }
                    Integer addSetter ;
                    If (response_Code == 'NBD' ){
                        addSetter = 1;
                    }else{
                        response_Code = response_Code.replace('NBD', '');
                        //if it is less than '17:00:00'
                        Integer createDateHours = dueDate.hour();
                        if(createDateHours < 17){
                            addSetter = 0;
                        }else{
                            addSetter = 1;
                        }
                    }
                    if(counterWithCreatedDate.containsKey(addSetter)){
                        dueDate = counterWithCreatedDate.get(addSetter);
                    }
                    return dueDate;
                }else if(response_Code == '8X5X10HR' ){
                    system.debug('condition 3 execute');
                    
                    
                    //apply the User Local Offset into the dateTime value
                    if(localOffset != null){
                        dueDate = createDateInEST.addHours(-Integer.valueOf(localOffset));
                    }else{
                        dueDate = createDateInEST;
                    }
                    //If ResponseCode = '8X5X10HR' 
                    Map<Integer, Datetime > counterWithCreatedDate = new Map<Integer, Datetime>();
                    //If the first two characters of ResponseCode = ‘NB’
                    Integer counter =0;
                    //Store the counter and createdDateTime as a key/value pair
                    counterWithCreatedDate.put(counter, dueDate);
                    
                    
                    for(Integer i=1; i<=10; i++){
                        DateTime newDateTime = createDateInEST.addDays(i);
                        newDateTime = newDateTime.addHours(i);
                        //If createdDateTime is not a weekend or a holiday then Store createdDateTime and counter in the key/value pair
                        //Need to add the get the Holidays from the Org and use those days for holidays  
                        if(!newDateTime.format('EEEE').equalsIgnoreCase('Saturday') && !newDateTime.format('EEEE').equalsIgnoreCase('Sunday') && (createDateInEST.hour() > 06 && createDateInEST.hour() < 17)){
                            counterWithCreatedDate.put(i, newDateTime);
                        }
                        if(counterWithCreatedDate.containsKey(10)){
                            dueDate = counterWithCreatedDate.get(10);
                        }
                    }
                    return dueDate;
                }else if(response_Code == 'Best Effort ASAP' ){
                    system.debug('condition 4 execute');
                    
                    //apply the User Local Offset into the dateTime value
                    if(localOffset != null){
                        dueDate = createDateInEST.addHours(-Integer.valueOf(localOffset));
                    }else{
                        dueDate = createDateInEST;
                    }
                    
                    //If ResponseCode = 'Best Effort ASAP'
                    //get the minutes from the converted createdDateTime
                    Integer createDateMinute = dueDate.minute();
                    system.debug('createdDateTime-->'+createDateMinute);
                    if(createDateMinute >= 0 && createDateMinute <= 14){
                        //when timeVar between '00' and '14' then dateSetter = '15:00.000'
                        dateSetter = 15;
                    }else if(createDateMinute >= 15 && createDateMinute <= 29){
                        //when timeVar between '15' and '29' then dateSetter = '30:00.000'
                        dateSetter = 30;
                    }else if(createDateMinute >= 30 && createDateMinute <= 44){
                        //when timeVar between '30' and '44' then dateSetter = '45:00.000' 
                        dateSetter = 45;    
                    }else if(createDateMinute >= 45 && createDateMinute <= 59){
                        ////when timeVar between '45' and '59' then dateSetter = '00:00.000'
                        dateSetter = 00;    
                    }
                    if(dateSetter == 00){
                        //if dateSetter= '00:00.000' then Add the result to dateSetter and subtract 1 hour
                        dueDate = dueDate.addHours(dateSetter - 1);
                    }else {
                        dueDate = dueDate.addHours(dateSetter);
                    }
                    
                    return dueDate;
                }else if(response_Code <> 'Best Effort ASAP'){
                    //If ResponseCode <> 'Best Effort ASAP' 
                    //If (createdDateTime <'7:45:00' or createdDateTime >'17:45:00) OR createdDateTime is a weekend or holiday
                    //Need to add the get the Holidays from the Org and use those days for holidays  
                    //
                    //apply the User Local Offset into the dateTime value
                    if(localOffset != null){
                        dueDate = createDateInEST.addHours(-Integer.valueOf(localOffset));
                    }else{
                        dueDate = createDateInEST;
                    }
                    Integer timeInMinutes = dueDate.hour()*60 + dueDate.minute();  
                    if(
                        timeInMinutes <  (7 *60) +45 || timeInMinutes > (17 *60) +45 || currentTime.format('EEEE').equalsIgnoreCase('Saturday') 
                        || currentTime.format('EEEE').equalsIgnoreCase('Sunday')
                    )
                    {
                        //Set AdditionalMessage = 'Please confirm Customer Site availability for the above DTTM value.'
                    }  
                    
                    return dueDate;
                }               
                return null;
              /*  string s=null;
                DateTime dtl ;        
                dtl = dateTimeList[1];                                    
                s = dtl.format('yyyy-MM-dd\'T\'HH:mm:ss.SSS'); 
                system.debug('string Date is : '+s);
                return s;
                
            }else{
                 dueDate = createDateInEST;
                if(localOffset != null){
                    dueDate = dueDate.addHours(- Integer.valueOf(localOffset));
                }
                return dueDate;
            }
          
         
        }    
         
         Catch(Exception exp)
        {   
            system.debug('error---->'+exp.getMessage()+' at line Number -->'+exp.getStackTraceString());
            return null;
        }
        //return null; 
    
    } 

}
*/
    
    /* 
     * <aura:component  controller ="OpportunityOverRideController" implements="force:appHostable,flexipage:availableForAllPageTypes,force:lightningQuickAction,flexipage:availableForRecordHome,force:hasRecordId" access="global" >
	
    <aura:attribute name="lstOfRecordType" type="String[]"/> 
     <aura:attribute name="isOpenRecType" type="Boolean" default="true" />
     <aura:attribute name="ShowScreen1" type="Boolean" default="false" />
    <aura:attribute name="Parent_id" type="id"/>
    <aura:attribute name="recordId" type="Id" />
    <aura:attribute name="name" type="string"/>
    <aura:attribute name="accountId" type="string"/>
    <aura:attribute name="contactId" type="string"/>
   <aura:attribute name="recordtypeid" type="string"/>
   <aura:attribute name="Deal" type="Deal__c"/>
     <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    
     <aura:if isTrue="{!v.isOpenRecType}">
        <div role="dialog" tabindex="-1" aria-labelledby="header43" class="slds-modal slds-fade-in-open">
            <div class="slds-modal__container">
                <div class="slds-modal__header">
                    <button class="slds-button slds-modal__close slds-button--icon-inverse" title="Close" onclick="{!c.closeModelForRecTypeSelection}">
                        X<span class="slds-assistive-text">Cancel</span>
                    </button>
                    <h2 id="header43" class="slds-text-heading--medium">New Opportunity</h2>
                </div>
                
                <div class="slds-modal__content slds-p-around--medium">
                    <div class="slds-grid slds-wrap">
                        <div class="slds-size--1-of-2 slds-large-size--1-of-2">
                            <div class="slds-align--absolute-center">Select a Record Type</div>                            
                        </div>
                        <div class="slds-size--1-of-2 slds-large-size--1-of-2">
                            <ui:inputSelect aura:id="selectid">
                                <aura:iteration items="{!v.lstOfRecordType}" var="oppty">                            
                                    <ui:inputSelectOption text="{!oppty}" label="{!oppty}"  />
                                </aura:iteration>
                            </ui:inputSelect>
                        </div>&nbsp; &nbsp;
                    </div>                   
                </div>
                
                <div class="slds-modal__footer">
                    <lightning:button class="slds-button slds-button--neutral" onclick="{!c.closeModelForRecTypeSelection}">Cancel</lightning:button>
                    <lightning:button class="slds-button slds-button--brand" onclick="{!c.opptyScreen1}">Next</lightning:button>
                </div>
            </div>
        </div>
        <div class="slds-backdrop slds-backdrop--open"></div>
    </aura:if>
     <aura:if isTrue="{!v.ShowScreen1}">
        <div role="dialog" tabindex="-1" aria-labelledby="header43" class="slds-modal slds-fade-in-open">
            <div class="slds-modal__container">
                <div class="slds-modal__header">
                    <button class="slds-button slds-modal__close slds-button--icon-inverse" title="Close" onclick="{!c.closeModelForRecTypeSelection}">
                        X<span class="slds-assistive-text">Cancel</span>
                    </button>
                    <h2 id="header43" class="slds-text-heading--medium">New Opportunity</h2>
                </div>
                
                <div class="slds-modal__content slds-p-around--medium">
                    <div class="slds-grid slds-wrap">
                        <div class="slds-size--1-of-2 slds-large-size--1-of-2">
                            <div class="slds-align--absolute-center">Select a Record Type</div>                            
                        </div>
                        
                    </div>                   
                </div>
                
                <div class="slds-modal__footer">
                    <lightning:button class="slds-button slds-button--neutral" onclick="{!c.closeModelForRecTypeSelection}">Cancel</lightning:button>
                    <lightning:button class="slds-button slds-button--brand" onclick="{!c.opptyScreen1}">Next</lightning:button>
                </div>
            </div>
        </div>
        <div class="slds-backdrop slds-backdrop--open"></div>
    </aura:if>
    
</aura:component>

----------------------------------------------------------------------------------
({
    doInit: function(component, event, helper) {
        alert('In Doinit');
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            component.set("v.lstOfRecordType", response.getReturnValue());
            alert('@@RType'+component.get("v.lstOfRecordType"));
        });
        $A.enqueueAction(action);
         alert('@@dealid'+component.get("v.recordId"));
         var action1 = component.get("c.getdefaultvalues");
         action1.setParams({
            "dealId": component.get("v.recordId")
        });  
        action1.setCallback(this, function(response) {
            component.set("v.Deal", response.getReturnValue());
            alert('@@Deal'+component.get("v.Deal"));
        });
        $A.enqueueAction(action1);
    },
    closeModelForRecTypeSelection: function(component, event, helper) {
        // for close Model,set the “isOpen” attribute to “false”
        component.set("v.isOpenRecType", false);
        component.set("v.ShowScreen1", true);
    },
    opptyScreen1:function(component, event, helper){
        component.set("v.isOpenRecType", false);
        alert('@@Deal');
        
        
         //var RecTypeID ;
        var action = component.get("c.getrecordtypeid");
         alert('@@Deal@@');
        var recTypeLabel = component.find("selectid").get("v.value");
        //var recval =recTypeLabel.get("v.value");
        alert(recTypeLabel+'recval###');
        action.setParams({
            "recordTypeLabel": recTypeLabel
        });  
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("first callbak "+ response.getReturnValue() );
                var RecTypeID  = response.getReturnValue();
                alert(RecTypeID);
                
                component.set("v.recordtypeid",RecTypeID);
            }
            else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
      /* var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Opportunity",
            "defaultFieldValues":{
                "Parent_id" : component.get("v.Parent_id"),
                "Name" :component.get("v.Deal").name,
                "AccountId" : component.get("v.Deal").Account__c,
                "ContactId" : component.get("v.Deal").Principal_Contact__c
            },
            "recordTypeId": component.get("v.recordtypeid")
        })
    }
    
    
    
})
------------------------------------------------------------------------------
public class OpportunityOverRideController {
       public static Map<Id, String> recordtypemap {get;set;}
    
   @AuraEnabled        
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = opportunity.SObjectType.getDescribe().getRecordTypeInfos();    
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
            recordtypemap.put(rt.getRecordTypeId(), rt.getName());
        } 
        system.debug('@@@######'+recordtypemap.values());
        return recordtypemap.values(); 
    }
    
   @AuraEnabled
    public static Deal__c getdefaultvalues(id dealId){
         system.debug('@@@dealId######'+dealId);
        Deal__c dealobj =[select id,name ,Account__c,Principal_Contact__c from Deal__c where id=:dealId limit 1];
        system.debug('@@@dealobj######'+dealobj);
        return dealobj;
    }
    @AuraEnabled
    public static string getrecordtypeid(string recordTypeLabel){
        string Id = [SELECT id from RecordType where Name =:recordTypeLabel and sObjectType='opportunity'].Id;
         system.debug('@@@Id######'+Id);
        return Id;
    }

}
*/
}