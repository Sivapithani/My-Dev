public class ContactControllerfrvf {
    public List<contact> contactList {get;set;}   
    public ContactControllerfrvf(){
         contactList =[select Id,Name,Phone,Email From contact where name !=null and email !=null];
           }
}