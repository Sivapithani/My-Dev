public class Sharepointconnecter {
public static String getToken(){
        String token;
      if(!Test.isRunningTest()){
        token = SharePointAPIUtility.SharePointAPIGet
          ('http://testingalgoworks.azurewebsites.net/Api/Values/GetAuthToken','Test@test.com','TestingPassword');
        }
      system.debug('token>>> '+token);
           if(token != null){
        return EncodingUtil.urlEncode(token.replaceAll('"',''), 'UTF-8');
        }
        return null;
        }
       
    
}