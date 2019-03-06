public class CustomAppLauncherClass {

    @AuraEnabled
    public static List<AppMenuItem> getAllApps(){
        return [SELECT ApplicationId,Label,LogoUrl,Name,Description, Type FROM AppMenuItem WHERE Type = 'TabSet'];
    }
}