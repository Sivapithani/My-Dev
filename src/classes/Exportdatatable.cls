public class Exportdatatable {
/* 
<apex:page id="myPage" standardController="ocm_LegalEntity__c" extensions="CIEControlPersionsReportController" contentType="application/vnd.ms-excel#ControlPersionsReport.xls" cache="true">
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    </head>
    <style>        
        .headerCSS {padding:0px; font-family:ScalaSans-Caps; border:1px solid #A4A4A4; font-size:0.90em; border-spacing: 1px; border-bottom-style: solid ; border-bottom-color: green; border-bottom-width: 1px;}
        .borderCss {border-width: 1px; border-style: solid; border-color: #A4A4A4;}
        .columnCss {font-size:0.90em; font-family: Times New Roman; border-width: 1px; border-style: solid; border-color: #A4A4A4; padding:0px;}        
    </style>
    <table>
      <thead>
        <tr class="headerCSS"> 
         <th >Full Name</th>
        <th >Account ID </th>
        <th >Control Person Title</th>
        <th >Control Person Address Line 1 </th>
        <th >Control Person Address Line 2 </th>
        <th > Control Person City </th>
        <th >Control Person State/Province </th>
        <th >Control Person Zip/Postal Code </th>
        <th >Control Person Country </th>
        <th >Control Person Date of Birth  </th>
        <th >Control Person SSN  
        </th><th >Control Person Passport/ID  </th>
        <th > Control Person Passport/ID Country </th></tr>
       </thead>
       <tbody>
        <apex:repeat value="{!ListOfLegalEntities}" var="control">
            <tr class="columnCss">
                <td>
                     <apex:outputText value="{!control.Control_Person_First_Name__c}"/><apex:outputText value="{!control.Control_Person_Last_Name__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_First_Name__c}" /><apex:outputText value="{!control.Control_Person_Last_Name__c}"/> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Title__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Address_Line_1__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Address_Line_2__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_City__c}" />
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_State_Province__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Zip_Postal_Code__c}" />
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Date_of_Birth__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Country__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_SSN__c}" /> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Passport__c}"/> 
                 </td>
                 <td>
                     <apex:outputText value="{!control.Control_Person_Passport_Country_of_Issua__c}" /> 
                 </td>   
              </tr>
           </apex:repeat>
          </tbody>
      </table>
</apex:page>

*/
}