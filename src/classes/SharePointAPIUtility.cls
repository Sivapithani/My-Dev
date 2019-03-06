public class SharePointAPIUtility {
    
    public static String SharePointAPIGet(String endpointUrl,String username, String password){
        try{
            HttpRequest httpRequestObject = new HttpRequest();
            httpRequestObject.setEndPoint(endpointUrl);
            httpRequestObject.setmethod('GET');
            Blob headerValue = Blob.valueOf(username + ':' + password);
            String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
            httpRequestObject.setHeader('Authorization', authorizationHeader);
            httpRequestObject.setTimeout(120000);
            system.debug('httpRequestObject>> '+httpRequestObject);
            Http http = new Http();
            HttpResponse httpResponse ;
            if(!test.isRunningTest())
                httpResponse = http.send(httpRequestObject);
            if(httpResponse != null && httpResponse.getStatus() == 'OK' 
               && httpResponse.getStatusCode() == 200){
                   system.debug('httpResponse.getBody();>>>>'+httpResponse.getBody()+'httpResponse.getBody();>>>>');
                   return httpResponse.getBody();
               }else if(httpResponse != null){
                   return 'SharePoint Server Error: Status '+ httpResponse.getStatus()+'Status Code '+ httpResponse.getStatusCode() +' Body '+httpResponse.getBody();
               }
        }catch(CalloutException ce){
            throw ce;
        }catch(Exception ex){
            throw ex;
        }
        return null;
    }
     /* public static List<String> getAllFolders(SharePoint365APIParser objSharePoint365APIParser){
        try{
            list<String> objFolders = new list<String>();
            if(objSharePoint365APIParser.folders != 
               null && objSharePoint365APIParser.folders.size()>0)//null check
                for(SharePoint365APIParser.folders sp:objSharePoint365APIParser.folders){
                    objFolders.add(sp.name);
                }
            return objFolders;
        }catch(Exception ex){
            throw ex;
        }
        return null;
    }
  public static List<String> getFilesByFolder(String folderName, SharePoint365APIParser objSharePoint365APIParser){
        //if(!test.isRunningTest()){
        try{
            if(objSharePoint365APIParser.folders != null && objSharePoint365APIParser.folders.size()>0)
                for(SharePoint365APIParser.folders sp:objSharePoint365APIParser.folders){
                    if(sp.name.equalsIgnoreCase(folderName)){
                        if(sp.files.size() > 0){             
                            return sp.files;
                        }else{
                            return new list<String>();
                        }
                    }
                }
        }catch(Exception ex){
            throw ex;
        }
        //}//end running test loop
        return null;
    } */
    
}