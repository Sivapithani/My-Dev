global class Leadassignment implements Schedulable{

    global  void execute(SchedulableContext sc)
    { 
        UpdateLeadOwner bth=new UpdateLeadOwner ();
        Database.executeBatch(bth,20);
    }

}