public class entitlementTriggerHandler {
    public static boolean isBeforeCallFire = false;
    public static boolean isAftreCallFire = false;
    public static void handleAftrinsert(list<entitlement>newasset){
        try{
            if(!isAftreCallFire)
                isAftreCallFire = true;
            set<id> assetSet =new set<id>();
            for(entitlement obj:newasset){
                assetSet.add(obj.AssetId);   
            }
            if(assetSet !=null && assetSet.size()>0)
                updateassetfileds(assetset);
        }
        catch(Exception e)
        {
          /*  for(entitlement et :newasset)
            {
                et.addError(e.getMessage());
            }   */
            system.debug('ErrorMessage'+e.getMessage());
        }    
    }
    public static void handleAftrUpdate(map<id,entitlement> newetmap ,map<id,entitlement>oldetmap){
        try{
            if(!isAftreCallFire)
                isAftreCallFire = true;
            
            set<id> assetSet =new set<id>();
            for(entitlement et:newetmap.values())
            {   
                if(et.status != oldetmap.get(et.ID).status)
                {
                    if(et.AssetId != null)
                        assetSet.add(et.AssetId);
                }
            }
            if(assetSet !=null && assetSet.size()>0)
                updateassetfileds(assetset);
        }
        catch(Exception e)
        {
            /*for(entitlement et :newetmap.values())
            {
                et.addError(e.getMessage());
            }   */
            system.debug('ErrorMessage'+e.getMessage());
        }
    }
    public static void handelAfterdDelete(map<id,entitlement> oldMap)
    {
        try
        {   
            if(!isAftreCallFire)
                isAftreCallFire = true;
            
            set<id> assetSet =new set<id>();
            for(entitlement et :oldMap.values())
            {
                if(et.AssetId != null)
                    assetSet.add(et.AssetId);    
            }
            if(assetSet != null && assetSet.size()>0)
                updateassetfileds(assetSet);
        }
        catch(Exception e)
        {
           system.debug('ErrorMessage'+e.getMessage()); 
        }
    }
    public static void updateassetfileds(set<id>assetset){
        
        list<asset> tobeUpdated = new list<asset>();
        List<asset> assetList =[select id,name,No_of_Entitlemens__c,Has_Entitlements__c,(select id,name from entitlements where status ='active') from asset where id IN :assetSet];
        if(assetList.size()>0 && assetList != null)
        {
            for(asset asobj:assetList){
                if(asobj.entitlements.size()>0 && asobj.entitlements !=null )
                {
                    asobj.No_of_Entitlemens__c =asobj.entitlements.size();
                    asobj.Has_Entitlements__c =true;
                   }
                else
                {
                   asobj.No_of_Entitlemens__c =0; 
                   asobj.Has_Entitlements__c =false;
                }
                 tobeUpdated.add(asobj); 
            }
        }
        if(tobeUpdated.size()>0 && tobeUpdated != null)
            update tobeUpdated;   
    }
}