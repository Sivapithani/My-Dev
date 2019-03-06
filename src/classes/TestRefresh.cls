public class TestRefresh {
@AuraEnabled 
    Public static void refreshstring(string recordId,string stage){
        opportunity opp =[select id,name,StageName from opportunity where id=:recordId];
        opp.StageName =stage;
        update opp;
    }
}