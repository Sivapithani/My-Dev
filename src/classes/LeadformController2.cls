public class LeadformController2
{
    public integer count{get; set;}
    public boolean iscount{get; set;}
    public string selectedvalue1 {get; set;}
    public string selectedvalue2 {get; set;}
    public string selectedvalue3 {get; set;}
    
    public LeadformController2()
    {
        count =0;
        iscount =false;
    }
    public List<SelectOption> getitems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Diploma','Diploma')); 
        options.add(new SelectOption('Graduation','Graduation')); 
        options.add(new SelectOption('Post-Graduation','Post-Graduation')); 
        return options; 
    } 
    public List<SelectOption> getitems2() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('other','other')); 
        options.add(new SelectOption('Female','Female')); 
        options.add(new SelectOption('Male','Male')); 
        return options; 
    } 
    public List<SelectOption> getitems3() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Divorced','Divorced')); 
        options.add(new SelectOption('Unmaried','Unmaried')); 
        options.add(new SelectOption('Married','Married')); 
        return options; 
    } 
   
    public void save()
    {
        system.debug('educationvalue'+selectedvalue1);
        if(selectedvalue1 =='Diploma')
        {
            iscount= true;
            count =1;  
        }
        if(selectedvalue1 =='Diploma' && selectedvalue2== 'other' && selectedvalue3== 'Divorced')
        {
            iscount= true;
            count =3;  
        }
        if(selectedvalue1 =='Post-Graduation' && selectedvalue2== 'Male' && selectedvalue3== 'Married')
        {
            iscount= true;
            count =9;  
        }
    }
    
}