global class BirthdayNameOptions implements Schedulable{

global   void execute(SchedulableContext dc){
//batch class name   
 BirthdayWishes bth=new BirthdayWishes ();
    Database.executeBatch(bth,20);
    }
}