// This file is generated as an Apex representation of the
    //     corresponding sObject and its fields.
    // This read-only file is used by the Apex Language Server to
    //     provide code smartness, and is deleted each time you
    //     refresh your sObject definitions.
    // To edit your sObjects and their fields, edit the corresponding
    //     .object-meta.xml and .field-meta.xml files.
    
    global class OrderDetails__x {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String DisplayUrl;
    global String ExternalId;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Id orderID__c;
    global Orders__x orderID__r;
    global Double orderLine__c;
    global String product__c;
    global Double quantity__c;
    global Double unitPrice__c;

    global OrderDetails__x () 
    {
    }
}