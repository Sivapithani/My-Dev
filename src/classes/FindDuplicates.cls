public class FindDuplicates {
/* 
 * public with sharing class CIEControlPersionsReportController 
{
    public transient list<ResultWrapper> Results {get;set;}
    
    public CIEControlPersionsReportController()
    {       
        set<string> rmoeveDuplicates = new set<string>();
        Results = new list<ResultWrapper>();
         
        for(ocm_LegalEntity__c cie: [Select o.Control_Person_Zip_Postal_Code__c, o.Control_Person_Title__c, o.Control_Person_State_Province__c, o.Control_Person_SSN__c, o.Control_Person_Passport__c, o.Control_Person_Passport_Country_of_Issua__r.Name, o.Control_Person_Last_Name__c, o.Control_Person_First_Name__c, o.Control_Person_Date_of_Birth__c, o.Control_Person_Country__r.Name, o.Control_Person_City__c, o.Control_Person_Address_Line_2__c, o.Control_Person_Address_Line_1__c,
        o.Beneficial_Owner_4_Zip_Postal_Code__c, o.Beneficial_Owner_4_State_Province__c, o.Beneficial_Owner_4_SSN__c, o.Beneficial_Owner_4_Passport__c, o.Beneficial_Owner_4_Passport_Country__r.Name, o.Beneficial_Owner_4_Last_Name__c, o.Beneficial_Owner_4_First_Name__c, o.Beneficial_Owner_4_Date_of_Birth__c, o.Beneficial_Owner_4_Country__r.Name, o.Beneficial_Owner_4_City__c, o.Beneficial_Owner_4_Address_Line_2__c, o.Beneficial_Owner_4_Address_Line_1__c, 
        o.Beneficial_Owner_3_Zip_Postal_Code__c, o.Beneficial_Owner_3_State_Province__c, o.Beneficial_Owner_3_SSN__c, o.Beneficial_Owner_3_Passport__c, o.Beneficial_Owner_3_Passport_Country__r.Name, o.Beneficial_Owner_3_Last_Name__c, o.Beneficial_Owner_3_First_Name__c, o.Beneficial_Owner_3_Date_of_Birth__c, o.Beneficial_Owner_3_Country__r.Name, o.Beneficial_Owner_3_City__c, o.Beneficial_Owner_3_Address_Line_2__c, o.Beneficial_Owner_3_Address_Line_1__c, 
        o.Beneficial_Owner_2_Zip_Postal_Code__c, o.Beneficial_Owner_2_State_Province__c, o.Beneficial_Owner_2_SSN__c, o.Beneficial_Owner_2_Passport__c, o.Beneficial_Owner_2_Passport_Country__r.Name, o.Beneficial_Owner_2_Last_Name__c, o.Beneficial_Owner_2_First_Name__c, o.Beneficial_Owner_2_Date_of_Birth__c, o.Beneficial_Owner_2_Country__r.Name, o.Beneficial_Owner_2_City__c, o.Beneficial_Owner_2_Address_Line_2__c, o.Beneficial_Owner_2_Address_Line_1__c,
        o.Beneficial_Owner_1_Zip_Postal_Code__c, o.Beneficial_Owner_1_State_Province__c, o.Beneficial_Owner_1_SSN__c, o.Beneficial_Owner_1_Passport__c, o.Beneficial_Owner_1_Passport_Country__r.Name, o.Beneficial_Owner_1_Last_Name__c, o.Beneficial_Owner_1_First_Name__c, o.Beneficial_Owner_1_Date_of_Birth__c, o.Beneficial_Owner_1_Country__r.Name, o.Beneficial_Owner_1_City__c, o.Beneficial_Owner_1_Address_Line_2__c, o.Beneficial_Owner_1_Address_Line_1__c 
        From ocm_LegalEntity__c o where (Control_Person_First_Name__c != '' AND Control_Person_Last_Name__c != '') order by Control_Person_First_Name__c asc])
        {
            if(string.isNotEmpty(cie.Control_Person_First_Name__c) && string.isNotEmpty(cie.Control_Person_Last_Name__c))
            {               
                string cieKey = '';
                if(string.isNotEmpty(cie.Control_Person_SSN__c))
                    cieKey = cie.Control_Person_First_Name__c +' '+cie.Control_Person_Last_Name__c+' '+cie.Control_Person_SSN__c;
                else
                    cieKey = cie.Control_Person_First_Name__c +' '+cie.Control_Person_Last_Name__c+' No SSN';
                         
                if(rmoeveDuplicates != null && rmoeveDuplicates.size() > 0)
                {
                    if(!(rmoeveDuplicates.contains(cieKey)))
                    {
                        rmoeveDuplicates.add(cieKey);
                        addRW(cie.Control_Person_First_Name__c, cie.Control_Person_Last_Name__c, cie.Control_Person_Title__c, cie.Control_Person_Address_Line_1__c, cie.Control_Person_Address_Line_2__c, cie.Control_Person_City__c, cie.Control_Person_State_Province__c, cie.Control_Person_Zip_Postal_Code__c, cie.Control_Person_Country__r.Name, cie.Control_Person_Date_of_Birth__c, cie.Control_Person_SSN__c, cie.Control_Person_Passport__c, cie.Control_Person_Passport_Country_of_Issua__r.Name);
                    }
                }
                else
                {
                    rmoeveDuplicates.add(cieKey);
                    addRW(cie.Control_Person_First_Name__c, cie.Control_Person_Last_Name__c, cie.Control_Person_Title__c, cie.Control_Person_Address_Line_1__c, cie.Control_Person_Address_Line_2__c, cie.Control_Person_City__c, cie.Control_Person_State_Province__c, cie.Control_Person_Zip_Postal_Code__c, cie.Control_Person_Country__r.Name, cie.Control_Person_Date_of_Birth__c, cie.Control_Person_SSN__c, cie.Control_Person_Passport__c, cie.Control_Person_Passport_Country_of_Issua__r.Name);
                }
            }
            if(string.isNotEmpty(cie.Beneficial_Owner_1_First_Name__c) && string.isNotEmpty(cie.Beneficial_Owner_1_Last_Name__c))
            {               
                string cieKey = '';
                if(string.isNotEmpty(cie.Beneficial_Owner_1_SSN__c))
                    cieKey = cie.Beneficial_Owner_1_First_Name__c +' '+cie.Beneficial_Owner_1_Last_Name__c+' '+cie.Beneficial_Owner_1_SSN__c;
                else
                    cieKey = cie.Beneficial_Owner_1_First_Name__c +' '+cie.Beneficial_Owner_1_Last_Name__c+' No SSN';
                         
                if(rmoeveDuplicates != null && rmoeveDuplicates.size() > 0)
                {
                    if(!(rmoeveDuplicates.contains(cieKey)))
                    {
                        rmoeveDuplicates.add(cieKey);
                        addRW(cie.Beneficial_Owner_1_First_Name__c, cie.Beneficial_Owner_1_Last_Name__c, '',cie.Beneficial_Owner_1_Address_Line_1__c, cie.Beneficial_Owner_1_Address_Line_2__c, cie.Beneficial_Owner_1_City__c, cie.Beneficial_Owner_1_State_Province__c, cie.Beneficial_Owner_1_Zip_Postal_Code__c, cie.Beneficial_Owner_1_Country__r.Name, cie.Beneficial_Owner_1_Date_of_Birth__c, cie.Beneficial_Owner_1_SSN__c, cie.Beneficial_Owner_1_Passport__c, cie.Beneficial_Owner_1_Passport_Country__r.Name);
                    }
                }
                else
                {
                    rmoeveDuplicates.add(cieKey);
                    addRW(cie.Beneficial_Owner_1_First_Name__c, cie.Beneficial_Owner_1_Last_Name__c, '',cie.Beneficial_Owner_1_Address_Line_1__c, cie.Beneficial_Owner_1_Address_Line_2__c, cie.Beneficial_Owner_1_City__c, cie.Beneficial_Owner_1_State_Province__c, cie.Beneficial_Owner_1_Zip_Postal_Code__c, cie.Beneficial_Owner_1_Country__r.Name, cie.Beneficial_Owner_1_Date_of_Birth__c, cie.Beneficial_Owner_1_SSN__c, cie.Beneficial_Owner_1_Passport__c, cie.Beneficial_Owner_1_Passport_Country__r.Name);
                }
            }
            if(string.isNotEmpty(cie.Beneficial_Owner_2_First_Name__c) && string.isNotEmpty(cie.Beneficial_Owner_2_Last_Name__c))
            {               
                string cieKey = '';
                if(string.isNotEmpty(cie.Beneficial_Owner_2_SSN__c))
                    cieKey = cie.Beneficial_Owner_2_First_Name__c +' '+cie.Beneficial_Owner_2_Last_Name__c+' '+cie.Beneficial_Owner_2_SSN__c;
                else
                    cieKey = cie.Beneficial_Owner_2_First_Name__c +' '+cie.Beneficial_Owner_2_Last_Name__c+' No SSN';
                         
                if(rmoeveDuplicates != null && rmoeveDuplicates.size() > 0)
                {
                    if(!(rmoeveDuplicates.contains(cieKey)))
                    {
                        rmoeveDuplicates.add(cieKey);
                        addRW(cie.Beneficial_Owner_2_First_Name__c, cie.Beneficial_Owner_2_Last_Name__c, '',cie.Beneficial_Owner_2_Address_Line_1__c, cie.Beneficial_Owner_2_Address_Line_2__c, cie.Beneficial_Owner_2_City__c, cie.Beneficial_Owner_2_State_Province__c, cie.Beneficial_Owner_2_Zip_Postal_Code__c, cie.Beneficial_Owner_2_Country__r.Name, cie.Beneficial_Owner_2_Date_of_Birth__c, cie.Beneficial_Owner_2_SSN__c, cie.Beneficial_Owner_2_Passport__c, cie.Beneficial_Owner_2_Passport_Country__r.Name);
                    }
                }
                else
                {
                    rmoeveDuplicates.add(cieKey);
                    addRW(cie.Beneficial_Owner_2_First_Name__c, cie.Beneficial_Owner_2_Last_Name__c, '',cie.Beneficial_Owner_2_Address_Line_1__c, cie.Beneficial_Owner_2_Address_Line_2__c, cie.Beneficial_Owner_2_City__c, cie.Beneficial_Owner_2_State_Province__c, cie.Beneficial_Owner_2_Zip_Postal_Code__c, cie.Beneficial_Owner_2_Country__r.Name, cie.Beneficial_Owner_2_Date_of_Birth__c, cie.Beneficial_Owner_2_SSN__c, cie.Beneficial_Owner_2_Passport__c, cie.Beneficial_Owner_2_Passport_Country__r.Name);
                }
            }
            if(string.isNotEmpty(cie.Beneficial_Owner_3_First_Name__c) && string.isNotEmpty(cie.Beneficial_Owner_3_Last_Name__c))
            {               
                string cieKey = '';
                if(string.isNotEmpty(cie.Beneficial_Owner_3_SSN__c))
                    cieKey = cie.Beneficial_Owner_3_First_Name__c +' '+cie.Beneficial_Owner_3_Last_Name__c+' '+cie.Beneficial_Owner_3_SSN__c;
                else
                    cieKey = cie.Beneficial_Owner_3_First_Name__c +' '+cie.Beneficial_Owner_3_Last_Name__c+' No SSN';
                         
                if(rmoeveDuplicates != null && rmoeveDuplicates.size() > 0)
                {
                    if(!(rmoeveDuplicates.contains(cieKey)))
                    {
                        rmoeveDuplicates.add(cieKey);
                        addRW(cie.Beneficial_Owner_3_First_Name__c, cie.Beneficial_Owner_3_Last_Name__c, '',cie.Beneficial_Owner_3_Address_Line_1__c, cie.Beneficial_Owner_3_Address_Line_2__c, cie.Beneficial_Owner_3_City__c, cie.Beneficial_Owner_3_State_Province__c, cie.Beneficial_Owner_3_Zip_Postal_Code__c, cie.Beneficial_Owner_3_Country__r.Name, cie.Beneficial_Owner_3_Date_of_Birth__c, cie.Beneficial_Owner_3_SSN__c, cie.Beneficial_Owner_3_Passport__c, cie.Beneficial_Owner_3_Passport_Country__r.Name);
                    }
                }
                else
                {
                    rmoeveDuplicates.add(cieKey);
                    addRW(cie.Beneficial_Owner_3_First_Name__c, cie.Beneficial_Owner_3_Last_Name__c, '',cie.Beneficial_Owner_3_Address_Line_1__c, cie.Beneficial_Owner_3_Address_Line_2__c, cie.Beneficial_Owner_3_City__c, cie.Beneficial_Owner_3_State_Province__c, cie.Beneficial_Owner_3_Zip_Postal_Code__c, cie.Beneficial_Owner_3_Country__r.Name, cie.Beneficial_Owner_3_Date_of_Birth__c, cie.Beneficial_Owner_3_SSN__c, cie.Beneficial_Owner_3_Passport__c, cie.Beneficial_Owner_3_Passport_Country__r.Name);
                }
            }
            if(string.isNotEmpty(cie.Beneficial_Owner_4_First_Name__c) && string.isNotEmpty(cie.Beneficial_Owner_4_Last_Name__c))
            {               
                string cieKey = '';
                if(string.isNotEmpty(cie.Beneficial_Owner_4_SSN__c))
                    cieKey = cie.Beneficial_Owner_4_First_Name__c +' '+cie.Beneficial_Owner_4_Last_Name__c+' '+cie.Beneficial_Owner_4_SSN__c;
                else
                    cieKey = cie.Beneficial_Owner_4_First_Name__c +' '+cie.Beneficial_Owner_4_Last_Name__c+' No SSN';
                         
                if(rmoeveDuplicates != null && rmoeveDuplicates.size() > 0)
                {
                    if(!(rmoeveDuplicates.contains(cieKey)))
                    {
                        rmoeveDuplicates.add(cieKey);
                        addRW(cie.Beneficial_Owner_4_First_Name__c, cie.Beneficial_Owner_4_Last_Name__c, '',cie.Beneficial_Owner_4_Address_Line_1__c, cie.Beneficial_Owner_4_Address_Line_2__c, cie.Beneficial_Owner_4_City__c, cie.Beneficial_Owner_4_State_Province__c, cie.Beneficial_Owner_4_Zip_Postal_Code__c, cie.Beneficial_Owner_4_Country__r.Name, cie.Beneficial_Owner_4_Date_of_Birth__c, cie.Beneficial_Owner_4_SSN__c, cie.Beneficial_Owner_4_Passport__c, cie.Beneficial_Owner_4_Passport_Country__r.Name);
                    }
                }
                else
                {
                    rmoeveDuplicates.add(cieKey);
                    addRW(cie.Beneficial_Owner_4_First_Name__c, cie.Beneficial_Owner_4_Last_Name__c, '',cie.Beneficial_Owner_4_Address_Line_1__c, cie.Beneficial_Owner_4_Address_Line_2__c, cie.Beneficial_Owner_4_City__c, cie.Beneficial_Owner_4_State_Province__c, cie.Beneficial_Owner_4_Zip_Postal_Code__c, cie.Beneficial_Owner_4_Country__r.Name, cie.Beneficial_Owner_4_Date_of_Birth__c, cie.Beneficial_Owner_4_SSN__c, cie.Beneficial_Owner_4_Passport__c, cie.Beneficial_Owner_4_Passport_Country__r.Name);
                }
            }           
        }       
    }    
    
    private void addRW(string fName, string lName, string title, string addLine1, string addLine2, string city, string state, string zip, string country, string dob, string ssn, string ppId, string ppCountry)
    {
        ResultWrapper rw1 = new ResultWrapper();
        rw1.fName = fName;
        rw1.lName = lName;
        rw1.title = title;
        rw1.addLine1 = addLine1;
        rw1.addLine2 = addLine2;
        rw1.city = city;
        rw1.state = state;
        rw1.zip = zip;
        rw1.country = country;
        rw1.dob = dob;
        rw1.ssn = ssn;
        rw1.ppId = ppId;
        rw1.ppCountry = ppCountry;      
        Results.add(rw1); 
    }
    
    public class ResultWrapper
    {
        public string fName {get;set;}
        public string lName {get;set;}
        public string title {get;set;}
        public string addLine1 {get;set;}
        public string addLine2 {get;set;}
        public string city {get;set;}
        public string state {get;set;}
        public string zip {get;set;}
        public string country {get;set;}
        public string dob {get;set;}
        public string ssn {get;set;}
        public string ppId {get;set;}
        public string ppCountry {get;set;}
    }
}
 */
}