global class BirthdayWishes implements Database.Batchable<Contact>{
     global Iterable<Contact> start(Database.BatchableContext bc){
     list<Contact> sq=[select name ,Email from Contact where 	Birthdate=today and Email != null];
    return sq;
    }
   global  void execute(Database.BatchableContext bc, List<Contact> lst)
      {
list<Messaging.SingleEmailMessage> mail = new list<Messaging.SingleEmailMessage>();

        for(Contact e: lst)
        {
         Messaging.SingleEmailMessage maileach = new Messaging.SingleEmailMessage();
         list<string> toadd=new list<string>();
         toadd.add(e.Email );
          maileach.settoaddresses(toadd);
          maileach.setsubject('birthday wishes');
          maileach.setplaintextbody('happy birthday '+e.Name);
          mail.add(maileach);
        }
      
    Messaging.SendEmailResult[]  result  =Messaging.sendEmail( mail);
     
    } 
    global  void finish(Database.BatchableContext sc) {
      system.debug(sc);
  
    }
}