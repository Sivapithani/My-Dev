<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Assigned_With_HighPriority</fullName>
        <description>Case Assigned With HighPriority</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SupportCaseAssignmentNotification</template>
    </alerts>
    <alerts>
        <fullName>Case_CloseNotification</fullName>
        <description>Case CloseNotification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/caseclose_notification</template>
    </alerts>
    <rules>
        <fullName>Caseclose</fullName>
        <actions>
            <name>Case_CloseNotification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(IsClosed,if((ClosedDate - CreatedDate)&gt;2,true,false))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SendnotificationtoOwner</fullName>
        <actions>
            <name>Case_Assigned_With_HighPriority</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
