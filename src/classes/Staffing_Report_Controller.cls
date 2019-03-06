public class Staffing_Report_Controller {
     
    //public List<AggregateDocketReportModel> StaffingReport {get;set;}
    public integer size {get;set;} 
    @AuraEnabled
    public static list<cds_obj_ParticipantRecord__c>getParticipantnames(){
        list<cds_obj_ParticipantRecord__c> ListPnames = [select id, name from cds_obj_ParticipantRecord__c];
        return ListPnames;
    }
    public Staffing_Report_Controller() {
        //get court date and docket input from component
        
        //string ParticpantId = ApexPages.currentPage().getParameters().get('d'); 
        string doctype = ApexPages.currentPage().getParameters().get('d');        
       List<string> datestr = ApexPages.currentPage().getParameters().get('cd').split('-');   
        date courtDate = date.newInstance(
            Integer.valueOf(datestr[0]),
            Integer.valueOf(datestr[1]),
            Integer.valueOf(datestr[2]));

        //cds_cs_StaffingReport reporter = new cds_cs_StaffingReport(ParticpantId,courtDate);
        cds_cs_StaffingReport reporter = new cds_cs_StaffingReport(doctype,courtDate);
        //staffingReport = reporter.GetList();
        //size = staffingReport.size();
    }
    
}