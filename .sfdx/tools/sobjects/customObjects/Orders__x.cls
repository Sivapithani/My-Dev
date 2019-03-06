// This file is generated as an Apex representation of the
    //     corresponding sObject and its fields.
    // This read-only file is used by the Apex Language Server to
    //     provide code smartness, and is deleted each time you
    //     refresh your sObject definitions.
    // To edit your sObjects and their fields, edit the corresponding
    //     .object-meta.xml and .field-meta.xml files.
    
    global class Orders__x {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String DisplayUrl;
    global String ExternalId;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global List<OrderDetails__x> OrderDetails__r;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Double customerID__c;
    global Datetime orderDate__c;
    global Double orderID__c;
    global Datetime shippedDate__c;

    global Orders__x () 
    {
    }
}