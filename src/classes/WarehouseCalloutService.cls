public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout =true)
    public static void runWarehouseEquipmentSync(){
        httpRequest req =new httpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        //req.setHeader(key, value);
        req.setMethod('GET');
        Http http =new Http();
        Httpresponse res =http.send(req);
        if(res.getStatusCode() == 200){
            List<object> equipments =(List<object>) JSON.deserializeUntyped(res.getBody());
            List<Product2> Products=new  List<Product2>();
            for(object o:equipments){
            	Map<String, Object> mapProduct = (Map<String, Object>)o;
    			Product2 product = new Product2();
                product.Name = (string)mapProduct.get('name');
                product.Cost__c = (integer)mapProduct.get('cost');
                product.Current_Inventory__c = (integer)mapProduct.get('quantity');
                product.Lifespan_Months__c = (integer)mapProduct.get('lifespan');
                product.Maintenance_Cycle__c= (integer)mapProduct.get('maintenanceperiod');
                product.Warehouse_SKU__c =(string) mapProduct.get('sku');
                product.ProductCode  =(string) mapProduct.get('_id');
                Products.add(product);
            } 
            if(Products.size()>0)
              upsert Products;  
        }
    }

}