public class ExcelGeneration {
/*<apex:page id="myPage" standardController="Account" extensions="ActivityRollupOrgController" contentType="application/vnd.ms-excel#OrganizationActivityrollup.xls" cache="true">
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
         <th> <apex:outputText value="Activity" /> </th>
         <th> <apex:outputText value="Type"  /> </th>
         <th> <apex:outputText value="Date" /> </th> 
         <th> <apex:outputText value="Subject" /> </th>        
         <th> <apex:outputText value="Description / Comments" /> </th>
         <th> <apex:outputText value="Has Meeting Notes" /> </th>
         <th> <apex:outputText value="Related To"/> </th>
         <th> <apex:outputText value="Client Briefing Memo"/> </th>
         <th> <apex:outputText value="Owner"/> </th>
        </tr>
       </thead>
       <tbody>
        <apex:repeat value="{!results}" var="result">
            <tr class="columnCss">
                <td> <apex:outputText value="{!result.activity}" /> </td>
                <td> <apex:outputText value="{!result.activityType}" /> </td>
                <td style="text-align:right;, mso-number-format:\@;"><apex:outputText value="{!result.activityDateForXl}"/></td> 
                <td style="mso-number-format:\@;"> <apex:outputText value="{!result.activitySubject}"/> </td>        
                <td style="mso-number-format:\@;"> <apex:outputText value="{!result.description}"/> </td>
                <td> <apex:outputText value="{!result.HasMeetingNotes}"/> </td>
                <td> <apex:outputText value="{!result.relatedTo}"/> </td>
                <td> <apex:outputText value="{!result.activityInvestorBriefingMemo}"/> </td>
                <td> <apex:outputText value="{!result.assignedToUser}"/></td>
              </tr>
           </apex:repeat>
          </tbody>
      </table>
</apex:page> */
}