// This file is generated as an Apex representation of the
    //     corresponding sObject and its fields.
    // This read-only file is used by the Apex Language Server to
    //     provide code smartness, and is deleted each time you
    //     refresh your sObject definitions.
    // To edit your sObjects and their fields, edit the corresponding
    //     .object-meta.xml and .field-meta.xml files.
    
    global class Fulfillment__c {
    global List<ActivityHistory> ActivityHistories;
    global Id ActivityType__c;
    global Activity__c ActivityType__r;
    global String Address__c;
    global String AdventurePackageId__c;
    global Decimal Adventure_Package_Cost__c;
    global Id Adventure__c;
    global Product2 Adventure__r;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<Attachment> Attachments;
    global List<Case> Cases__r;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Decimal Deposit__c;
    global String Dietary_Restrictions__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global String Email__c;
    global List<EmailMessage> Emails;
    global List<Event> Events;
    global Id Expedition_Leader__c;
    global User Expedition_Leader__r;
    global Id Explorer__c;
    global Contact Explorer__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Fulfillment__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<Fulfillment__History> Histories;
    global String Home_Phone__c;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean Is_Exempt__c;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Id Lead_Marketer__c;
    global User Lead_Marketer__r;
    global String Mobile__c;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global Id Opportunity__c;
    global Opportunity Opportunity__r;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global String Preferred_form_of_Contact__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<EventRelationChangeEvent> Relation;
    global Date Schedule_Date__c;
    global String Special_Needs__c;
    global String Status__c;
    global Boolean Submitted_Waiver__c;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<EventChangeEvent> What;

    global Fulfillment__c () 
    {
    }
}