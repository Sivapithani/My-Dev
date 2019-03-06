public class LeadformController {
    public integer count{get; set;}
    public boolean iscount{get; set;}
    //Question1
    public boolean isdiploma{get; set;}
    public boolean isgradut{get; set;}
    public boolean ispost{get; set;}
    //Question 2
    public boolean isother{get; set;}
    public boolean isfemale{get; set;}
    public boolean ismale{get; set;}
    //Question3
    public boolean isdiv{get; set;}
    public boolean isunmarried{get; set;}
    public boolean ismarried{get; set;}
    public LeadformController(){
        count =0;
        iscount =false;
    }
    public void updatepage(){
        iscount =false;
    }
    public void save(){
        if(isdiploma ==true)
            {
                iscount= true;
              count =1;  
            }
        if(isdiploma ==true && isother== true && isdiv== true)
            {
                iscount= true;
              count =3;  
            }
         if(ispost ==true && ismale== true && ismarried== true)
            {
                iscount= true;
              count =9;  
            }
    }
}