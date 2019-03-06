public class cds_cs_StaffingReport {
    public list<account>acclist{get;set;}
     public list<contact>conlist{get;set;}
     public list<opportunity>opptylist{get;set;}
    //public cds_cs_StaffingReport(){}
    public cds_cs_StaffingReport(){
      acclist = [select id ,name,SLAExpirationDate__c ,(select id, lastname,Birthdate,LeadSource from contacts) , (select id,name,CloseDate from Opportunities) from account where id IN('0010I00001qQCrkQAG','0010I00001tfhMHQAY')]; 
        conlist =[select id, lastname,Birthdate,LeadSource from contact where AccountId IN('0010I00001qQCrkQAG','0010I00001tfhMHQAY')];
        opptylist=[select id,name,CloseDate from Opportunity where AccountId   IN('0010I00001qQCrkQAG','0010I00001tfhMHQAY')];
    }
 
}