public class PablocktableWithScrolable {
/* 
 <apex:page standardController="ocm_LegalEntity__c" extensions="CIEControlPersionsReportController" sidebar="false">
    
    <!-- Resources for jquery for fixed header  -->
    <script src="{!URLFOR($Resource.HeaderScoller,'jquery-1.11.3.min.js')}"></script>
    <script src="{!URLFOR($Resource.HeaderScoller,'jquery.dataTables.min.js')}"></script>
    <script src="{!URLFOR($Resource.HeaderScoller,'dataTables.fixedColumns.min.js')}"></script>
    <apex:stylesheet value="{!URLFOR($Resource.HeaderScoller,'jquery.dataTables.min.css')}"/>
    <apex:stylesheet value="{!URLFOR($Resource.HeaderScoller,'fixedColumns.dataTables.min.css')}"/> 
    <style>
        th, td { white-space: nowrap; } 
        .resizedTextbox {width: 80px; height: 15px}
        .headerSize {width: 150px; height: 15px}
        div.dataTables_wrapper { margin: 0 auto; }
        table.empty
        {
            border-spacing: 0;
            empty-cells:show;                 
        }
    </style>   
    <apex:form id="fromid">
        <apex:pageBlock title="Report for Control Persons" id="controlperson" rendered="{!isControl}">
            <apex:outputPanel id="dTable">
                 <div id="col">
                     <!-- Script for fixed header -->
                    <script type="text/javascript" charset="utf-8">                       
                           $(document).ready(function() {
                            var vph = $(window).height();
                            var vpw = $(window).width();
                            var table = $('#fixHead').DataTable( {
                                scrollY:        vph-350,
                                scrollX:        true,
                                scrollCollapse: false,
                                paging:         false,
                                "ordering":     false,
                                fixedColumns:   {
                                    leftColumns: 0,
                                    rightColumns: 0
                                }
                            } );
                            $(".dataTables_wrapper").width(vpw - 80);                    
                        } ); 
                    </script>
                    <div class="tempDiv">
                        <table width="100%"  cellpadding="0" cellspacing="0" border="1"  id="fixHead">
                            <thead>
                                <tr >
                                    <th Class="headerSize">
                                        Full Name
                                    </th>
                                    <th Class="headerSize">
                                        Account ID 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Title
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Address Line 1 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Address Line 2 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person City 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person State/Province 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Zip/Postal Code 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Country 
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Date of Birth  
                                    </th>
                                    <th Class="headerSize">
                                        Control Person SSN  
                                    </th>
                                    <th Class="headerSize">
                                        Control Person Passport/ID  
                                    </th>
                                    <th Class="headerSize"> 
                                      Control Person Passport/ID Country
                                    </th>
                              </tr>
                            </thead>
                            <tbody>
                                <apex:repeat value="{!ListOfLegalEntities}" var="control">
                                <tr>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_First_Name__c}" styleClass="resizedTextbox"/><apex:outputText value="{!control.Control_Person_Last_Name__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_First_Name__c}" styleClass="resizedTextbox"/><apex:outputText value="{!control.Control_Person_Last_Name__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Title__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Address_Line_1__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Address_Line_2__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_City__c}" styleClass="resizedTextbox"/>
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_State_Province__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Zip_Postal_Code__c}" styleClass="resizedTextbox"/>
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Date_of_Birth__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Country__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_SSN__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Passport__c}" styleClass="resizedTextbox"/> 
                                     </td>
                                     <td>
                                         <apex:outputText value="{!control.Control_Person_Passport_Country_of_Issua__c}" styleClass="resizedTextbox"/> 
                                     </td>   
                                 </tr>
                                 </apex:repeat>
                           </tbody>
                        </table>
                    </div>
                 </div>
        </apex:outputPanel>
        <br/>
        <div style="text-align:center">
            <apex:commandButton value="Export to Excel" action="{!exportdata}" />
        </div>
    </apex:pageBlock>   
    </apex:form>
</apex:page>
 */
}